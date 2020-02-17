package org.eco.collect.android.support;

import androidx.test.platform.app.InstrumentationRegistry;

import org.eco.collect.android.application.Collect;
import org.eco.collect.android.injection.config.AppDependencyComponent;
import org.eco.collect.android.injection.config.AppDependencyModule;
import org.eco.collect.android.injection.config.DaggerAppDependencyComponent;
import org.eco.collect.android.logic.FormController;

public final class CollectHelpers {

    private CollectHelpers() {
    }

    public static FormController waitForFormController() throws InterruptedException {
        if (Collect.getInstance().getFormController() == null) {
            do {
                Thread.sleep(1);
            } while (Collect.getInstance().getFormController() == null);
        }

        return Collect.getInstance().getFormController();
    }

    public static AppDependencyComponent getAppDependencyComponent() {
        Collect application = getApplication();
        return application.getComponent();
    }

    private static Collect getApplication() {
        return (Collect) InstrumentationRegistry
                .getInstrumentation()
                .getTargetContext()
                .getApplicationContext();
    }

    public static void overrideAppDependencyModule(AppDependencyModule appDependencyModule) {
        Collect application = getApplication();

        AppDependencyComponent testComponent = DaggerAppDependencyComponent.builder()
                .application(application)
                .appDependencyModule(appDependencyModule)
                .build();
        application.setComponent(testComponent);
    }
}
