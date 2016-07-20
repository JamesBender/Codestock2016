using System;
using Common;
using Ninject.Activation;
using Ninject.Modules;

namespace MyNinjectModules
{
    public class ConditionalLoggingModule : NinjectModule
    {
        private readonly bool _isConnected;

        public ConditionalLoggingModule(bool isConnected)
        {
            _isConnected = isConnected;
        }

        public override void Load()
        {
            Bind<ILoggingSink>().To<NormalLoggingSync>();
            
            if (_isConnected)
            {
                Bind<ILoggingComponent>().To<Logger>();
            }
            else
            {
                Bind<ILoggingComponent>().To<OffLineLoggingComponent>();
            }
            
            Bind<SimpleBusinessEngine>().ToSelf();
        }
    }
}