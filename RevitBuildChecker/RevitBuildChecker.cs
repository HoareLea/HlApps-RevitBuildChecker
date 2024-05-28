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

        private static readonly Dictionary<string, string> revit2020Builds = new Dictionary<string, string>
{
    {"20190327_2315(x64)", "20.0.0.377"},
    {"20190412_1200(x64)", "20.0.1.2"},
    {"20190725_1135(x64)", "20.1.0.81"},
    {"20190731_1515(x64)", "20.1.1.1"},
    {"20191031_1115(x64)", "20.2.0.48"},
    {"20191106_1200(x64)", "20.2.1.1"},
    {"20200206_0915(x64)", "20.2.11.3"},
    {"20200210_1400(x64)", "20.2.12.1"},
    {"20200426_1515(x64)", "20.2.20.31"},
    {"20200826_1250(x64)", "20.2.30.42"},
    {"20210420_1515(x64)", "20.2.40.65"},
    {"20210804_1515(x64)", "20.2.50.77"},
    {"20211019_1515(x64)", "20.2.60.15"},
    {"20220112_1230(x64)", "20.2.70.6"},
    {"20220225_1515(x64)", "20.2.80.2"},
    {"20220517_1515(x64)", "20.2.90.12"}
};

        public Result OnStartup(UIControlledApplication application)
        {
            //AssemblyResolver.init();
            // Get the local version information
            ControlledApplication controlledApp = application.ControlledApplication;
            string localVersionNumber = controlledApp.VersionNumber; // Example format: "23.1.30.97"
            string localBuildVersion = controlledApp.VersionBuild; // Example format: "20230101_1500(x64)"
            string subVersionNumber = controlledApp.SubVersionNumber;
            string localVersionName = controlledApp.VersionName;
            // Extract the year from the version number (first two digits)
            string localYear = "20" + localBuildVersion.Substring(0, 2); // This should correctly format the year as "2023"
            string localYear2020 = "20" + localVersionNumber.Substring(0, 2);
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
                if (versionsInfo.Versions.TryGetValue(localYear, out string expectedVersion) & localYear != "2020")
                {


                    // Compare versions
                    if (localBuildVersion.Equals(expectedVersion))
                    {
                        //TaskDialog.Show("Version Check", $"Your Revit {localYear} version is up to date.\nLocal Version: {localBuildVersion}");
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
                        //else
                        //{
                            //TaskDialog.Show("Error", $"Version data for Revit {localYear} not found in the file.");
                            //return Result.Failed;
                        //}
                    }
                }
                else
                {
                    if (localYear2020 == "2020")
                    {
                        if (revit2020Builds.TryGetValue(localBuildVersion, out string officialRelease))
                        {
                            if (localBuildVersion.Equals("20220517_1515(x64)"))
                            {
                                //TaskDialog.Show("Version Check", $"Your Revit {localYear} version is up to date.\nLocal Version: {localBuildVersion}\nExpected version: 20220517_1515(x64)");
                            }
                            else 
                            {
                                TaskDialog mainDialog = new TaskDialog("Critical Update Alert");
                                mainDialog.MainInstruction = "CRITICAL ALERT\r\nUpdate your Revit software to prevent model corruption.";
                                mainDialog.MainContent = $"Your Version: {localBuildVersion}\nLatest Version: 20220517_1515(x64)";
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
                                //TaskDialog.Show("NOTLATEST", "Local build version:" + localBuildVersion + " officialRelease:" + officialRelease+ " localrelease: "); 
                            }
                        }
                        //else { TaskDialog.Show("ERROR", "localBuildVersion: " + localBuildVersion + " Official release: " + officialRelease + " localversionnumber: " + localVersionNumber); }
                    }
                }
            
                }
            
            catch (Exception ex) // Catching all exceptions to simplify the example. Normally, you might handle different exceptions separately.
            {
                //TaskDialog.Show("Error", "Error accessing the web resource: " + ex.Message);
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
