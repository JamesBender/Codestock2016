using System;
using Common;
using Ninject.Modules;

namespace MyNinjectModules
{
    public class NamedDependencyModule : NinjectModule
    {
        public override void Load()
        {
            Bind<ILoggingSink>().To<DistributedLoggingSync>();            
            Bind<ILoggingComponent>().To<Logger>().Named("Simple");
            Bind<ILoggingComponent>().To<OffLineLoggingComponent>().Named("Offline");
        }
    }
}