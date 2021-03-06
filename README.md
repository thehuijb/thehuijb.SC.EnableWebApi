Thehuijb.SC.EnableWebApi
========================

this is a fork of [DEG.Shared.SC.EnableWebApi](https://github.com/degdigital/DEG.Shared.SC.EnableWebApi), thanks to [Patrick Delancy](https://github.com/PatrickDelancy)
- I removed the testcontroller cause I don't need it.
- I changed AbortSitecoreForKnownRoutes.cs to only abort for the web api route set in RegisterWebApiRoute.cs

This module applies the hooks necessary to enable custom WebApi controllers in a Sitecore project.

# Registering Routes

The default WebApi route is registered for you in the /WebApi/RegisterWebApiRoute.cs
You can modify the route here. (if you want to add routes, make sure you check for them in the AbortSitecoreForKnownRoutes.cs)

# Sitecore Pipeline Integration

This module hooks into 2 places in the Sitecore pipeline:
* initialize pipeline, in order to register the WebApi routes
* httpRequestBegin pipeline, in order to detect WebApi requests, and abort the Sitecore pipeline as necessary

# Sitecore Context

Because the WebApi routes are detected near the middle of the httpRequestBegin pipeline, the static Sitecore context objects are constructed and available for use from within the WebApi controllers!

# Config Patching

This module uses Sitecore Config patching to hook into the appropriate pipelines. All of this magic happens in /App_Config/Include/WebApi.Thehuijb.SC.Enable.config
You are recommended NOT to modify this file.
