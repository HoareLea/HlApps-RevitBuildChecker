using Autodesk.Revit.UI;
using Autodesk.Revit.ApplicationServices;
//using Newtonsoft.Json;
using System.IO;
using System.Collections.Generic;
using System;
using System.Text.Json;
using System.Linq;
using System.Reflection;

namespace RevitBuildChecker
{
    public class AssemblyResolver
    {
        public static List<string> AssemblyLocations = new List<string>();

        public static void init()
        {
            AppDomain currentDomain = AppDomain.CurrentDomain;
            currentDomain.AssemblyResolve += currentDomain_AssemblyResolve;
            AssemblyLocations.Add(Path.GetDirectoryName(Assembly.GetExecutingAssembly().Location));

        }

        public static Assembly currentDomain_AssemblyResolve(object sender, ResolveEventArgs args)
        {
            string asmFileName = new AssemblyName(args.Name).Name;
            foreach (string asmPath in AssemblyLocations)
            {
                DirectoryInfo asmDir = new DirectoryInfo(asmPath);
                if (!asmDir.Exists) continue;

                FileInfo asmFi = asmDir.EnumerateFiles(asmFileName + ".dll", SearchOption.AllDirectories).FirstOrDefault();

                if (asmFi == null) asmFi = asmDir.EnumerateFiles(asmFileName + ".exe", SearchOption.AllDirectories).FirstOrDefault();


                if (asmFi == null) continue;

                Assembly assembly = Assembly.LoadFrom(asmFi.FullName);
                return assembly;
            }
            return null;
        }
    }

    public class App : IExternalApplication
    {
        public Result OnStartup(UIControlledApplication application)
        {
            AssemblyResolver.init();
            // Get the local version information
            ControlledApplication controlledApp = application.ControlledApplication;
            string localVersionNumber = controlledApp.VersionNumber; // Example format: "23.1.30.97"
            string localBuildVersion = controlledApp.VersionBuild; // Example format: "20230101_1500(x64)"

            // Extract the year from the version number (first two digits)
            string localYear = "20" + localBuildVersion.Substring(0, 2); // This should correctly format the year as "2023"

            // Path to your JSON file
            string jsonFilePath = @"C:\SourceFiles\HLApps-Deployment-master\RevitVersionsInfo.json";

            // Read and parse JSON file
            try
            {
                string jsonContent = File.ReadAllText(jsonFilePath);
                // RevitVersionsInfo versionsInfo = JsonConvert.DeserializeObject<RevitVersionsInfo>(jsonContent);
                RevitVersionsInfo versionsInfo = JsonSerializer.Deserialize<RevitVersionsInfo>(jsonContent);
                // Get the build version from the JSON file for the corresponding year
                if (versionsInfo.Versions.TryGetValue(localYear, out string expectedVersion))
                {
                    // Compare versions
                    if (localBuildVersion.Equals(expectedVersion))
                    {
                        TaskDialog.Show("Version Check", $" Your Revit {localYear} version is up to date.\nLocal Version: {localBuildVersion}");
                    }
                    else
                    {
                        TaskDialog mainDialog = new TaskDialog("Critical Update Alert");
                        mainDialog.MainInstruction = "CRITICAL ALERT\r\nUpdate your Revit software to prevent model corruption.";
                        mainDialog.MainContent = $"Your Version: {localBuildVersion}\nLatest Version: {expectedVersion}";
                        mainDialog.FooterText = "Contact DigitalSupport@hoarelea.com if you have any issues.";
                        mainDialog.AddCommandLink(TaskDialogCommandLinkId.CommandLink1, "Open Software Center");

                        TaskDialogResult result = mainDialog.Show();
                       
                        // Check if the command link was clicked
                        if (result == TaskDialogResult.CommandLink1)
                        {
                            try
                            {
                                TaskDialog.Show("IMPORTANT", "Please close Revit before updating.");
                                // Attempt to start the external application
                                System.Diagnostics.Process.Start(@"C:\windows\CCM\SCClient.exe", "softwarecenter:Page=AvailableSoftware FilterType=4");
                            }
                            catch (Exception ex)
                            {
                                // Handle exceptions, for example if the file is not found
                                TaskDialog.Show("Error", "Failed to open Software Center: " + ex.Message);
                            }
                        }

                    }
                }
                else
                {
                    TaskDialog.Show("Error", $"Version data for Revit {localYear} not found in the file.");
                    return Result.Failed;
                }
            }
            catch (IOException ex)
            {
                TaskDialog.Show("Error", "Failed to read the version file: " + ex.Message);
                return Result.Failed;
            }
            catch (JsonException ex)
            {
                TaskDialog.Show("Error", "Failed to parse the version file: " + ex.Message);
                return Result.Failed;
            }

            return Result.Succeeded;
        }

        public Result OnShutdown(UIControlledApplication application)
        {
            return Result.Succeeded;
        }
    }

    public class RevitVersionsInfo
    {
        public Dictionary<string, string> Versions { get; set; }
    }
}
