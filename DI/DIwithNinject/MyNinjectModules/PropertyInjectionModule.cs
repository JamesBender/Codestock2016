using System;
using Common;
using Ninject.Modules;

namespace MyNinjectModules
{
    public class PropertyInjectionModule : NinjectModule
    {
        public override void Load()
        {
            Bind<ILoggingSink>().To<DistributedLoggingSync>();
            Bind<LegacyEngine>().ToSelf();

            Bind<ILoggingComponent>().To<OffLineLoggingComponent>();
            
            Bind<ILoggingComponent>().To<PropertyInjectedLoggingComponent>().WhenMemberHas<PropertyLogger>();

        }
    }
}