using System;
using Common;
using Ninject.Modules;

namespace MyNinjectModules
{
    public class ContextModule : NinjectModule
    {
        public override void Load()
        {
            Bind<ILoggingSink>().To<DistributedLoggingSync>();

            Bind<ILoggingComponent>().To<Logger>().WhenInjectedInto<GrandParent>();
            Bind<ILoggingComponent>().To<OffLineLoggingComponent>()
                .WhenInjectedExactlyInto<ChildEngineB>();
        }
    }   
}