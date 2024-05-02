using Autodesk.Revit.UI;
using Autodesk.Revit.ApplicationServices;
using System.IO;
using System.Collections.Generic;
using System;
using System.Text.Json;
using System.Linq;
using System.Reflection;
using System.Net.Http;

namespace RevitBuildChecker
{
    public class App : IExternalApplication
    {
        private static readonly HttpClient client = new HttpClient();

        public Result OnStartup(UIControlledApplication application)
        {
            //AssemblyResolver.init();
            // Get the local version information
            ControlledApplication controlledApp = application.ControlledApplication;
            string localVersionNumber = controlledApp.VersionNumber; // Example format: "23.1.30.97"
            string localBuildVersion = controlledApp.VersionBuild; // Example format: "20230101_1500(x64)"

            // Extract the year from the version number (first two digits)
            string localYear = "20" + localBuildVersion.Substring(0, 2); // This should correctly format the year as "2023"

            // URL to the JSON file on GitHub
            string jsonUrl = "https://raw.githubusercontent.com/HoareLea/HlApps-RevitBuildChecker/main/RevitBuildChecker/dist/RevitVersionsInfo.json";

            try
            {
                // Fetch and parse JSON file from GitHub synchronously
                HttpResponseMessage response = client.GetAsync(jsonUrl).Result;  // Using .Result is generally not recommended except under specific constraints like this one.
                response.EnsureSuccessStatusCode();
                string jsonContent = response.Content.ReadAsStringAsync().Result; // Blocking call
                RevitVersionsInfo versionsInfo = JsonSerializer.Deserialize<RevitVersionsInfo>(jsonContent);

                // Get the build version from the JSON file for the corresponding year
                if (versionsInfo.Versions.TryGetValue(localYear, out string expectedVersion))
                {
                    // Compare versions
                    if (localBuildVersion.Equals(expectedVersion))
                    {
                        TaskDialog.Show("Version Check", $"Your Revit {localYear} version is up to date.\nLocal Version: {localBuildVersion}");
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
                            TaskDialog.Show("IMPORTANT", "Please close Revit before updating.");
                            // Attempt to start the external application
                            System.Diagnostics.Process.Start(@"C:\windows\CCM\SCClient.exe", "softwarecenter:Page=AvailableSoftware FilterType=4");
                        }
                    }
                }
                else
                {
                    TaskDialog.Show("Error", $"Version data for Revit {localYear} not found in the file.");
                    return Result.Failed;
                }
            }
            catch (Exception ex) // Catching all exceptions to simplify the example. Normally, you might handle different exceptions separately.
            {
                TaskDialog.Show("Error", "Error accessing the web resource: " + ex.Message);
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
