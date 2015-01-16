using System.Linq;
using System.Web.Http;
using System.Web.Http.Dispatcher;
using Sitecore.Pipelines;

namespace $rootNamespace$.WebApi
{
    /// <summary>
    /// RegisterWebApiRoute class
    ///
    /// registers the route needed for the webapi to work
    /// </summary>
    public class RegisterWebApiRoute
    {
        /// <summary>
        /// Processes the specified arguments and add the route.
        /// to be used in the initialize pipeline.
        /// </summary>
        /// <param name="args">The pipeline arguments.</param>
        public void Process(PipelineArgs args)
        {
            var config = GlobalConfiguration.Configuration;
            config.Routes.MapHttpRoute("DefaultApiRoute",
                         "api/{controller}/{id}",
                         new {id = RouteParameter.Optional});

            /* comment out these lines to switch from JSON  to XML as the default WebApi response type */
            var appXmlType = config.Formatters.XmlFormatter.SupportedMediaTypes.FirstOrDefault(t => t.MediaType == "application/xml");
            config.Formatters.XmlFormatter.SupportedMediaTypes.Remove(appXmlType);
        }
    }
}
