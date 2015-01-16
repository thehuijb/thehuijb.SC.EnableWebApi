using System.Web;
using System.Web.Routing;
using Sitecore.Pipelines.HttpRequest;

namespace $rootNamespace$.WebApi
{
    /// <summary>
    /// AbortSitecoreForKnownRoutes
    /// </summary>
    public class AbortSitecoreForKnownRoutes : HttpRequestProcessor
    {
        /// <summary>
        /// Processes the specified args to determine if the request is a webapi request.
        /// use this in the httprequestbegin pipeline
        /// </summary>
        /// <param name="args">The args.</param>
        public override void Process(HttpRequestArgs args)
        {
            // get the registered webapi route
            var apiRoute = RouteTable.Routes["DefaultApiRoute"];
            // check if current request is consistent with the webapi route
            var routeData = apiRoute.GetRouteData(new HttpContextWrapper(args.Context));
            // if not continue the pipeline
            if (routeData == null) return;

            // else abort pipeline and execute the webapi call.
            HttpContext.Current.RemapHandler(routeData.RouteHandler.GetHttpHandler(HttpContext.Current.Request.RequestContext));
            args.AbortPipeline();
        }
    }
}
