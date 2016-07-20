using Common;
using Ninject.Modules;

namespace MyNinjectModules
{
    public class BasicLoggingModule : NinjectModule
    {
        public override void Load()
        {
            Bind<ILoggingSink>().To<DistributedLoggingSync>();
            Bind<ILoggingComponent>().To<Logger>();
            Bind<SimpleBusinessEngine>().ToSelf();
        }
    }    
}
