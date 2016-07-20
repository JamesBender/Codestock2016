using System;
using Common;
using Ninject.Activation;
using Ninject.Modules;

namespace MyNinjectModules
{
    public class CtorAndMethodModule : NinjectModule
    {
        public override void Load()
        {
            //Bind<ILoggingSink>().ToMethod(x => GetLogger());
            Bind<ILoggingComponent>()
                .ToConstructor(x => new CtorAndMethodComponent());

            Bind<ILoggingComponent>().ToProvider<OfflineLoggingCompoentProvider>();
        }

        private ILoggingSink GetLogger()
        {
            return new DistributedLoggingSync();
        }

        public class OfflineLoggingCompoentProvider : Provider<ILoggingComponent>
        {
            protected override ILoggingComponent CreateInstance(Ninject.Activation.IContext context)
            {
                //This is where your very complex creating logic will go
                return new OffLineLoggingComponent();
            }
        }
    }        
}