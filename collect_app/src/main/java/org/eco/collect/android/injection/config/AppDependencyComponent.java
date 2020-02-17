package org.eco.collect.android.injection.config;

import android.app.Application;
import android.telephony.SmsManager;

import org.javarosa.core.reference.ReferenceManager;
import org.eco.collect.android.activities.FormDownloadList;
import org.eco.collect.android.activities.FormEntryActivity;
import org.eco.collect.android.activities.GoogleDriveActivity;
import org.eco.collect.android.activities.GoogleSheetsUploaderActivity;
import org.eco.collect.android.activities.InstanceUploaderListActivity;
import org.eco.collect.android.adapters.InstanceUploaderAdapter;
import org.eco.collect.android.analytics.Analytics;
import org.eco.collect.android.application.Collect;
import org.eco.collect.android.events.RxEventBus;
import org.eco.collect.android.formentry.ODKView;
import org.eco.collect.android.fragments.DataManagerList;
import org.eco.collect.android.openrosa.OpenRosaAPIClient;
import org.eco.collect.android.openrosa.OpenRosaHttpInterface;
import org.eco.collect.android.logic.PropertyManager;
import org.eco.collect.android.preferences.ServerPreferencesFragment;
import org.eco.collect.android.tasks.InstanceServerUploaderTask;
import org.eco.collect.android.tasks.ServerPollingJob;
import org.eco.collect.android.tasks.sms.SmsNotificationReceiver;
import org.eco.collect.android.tasks.sms.SmsSender;
import org.eco.collect.android.tasks.sms.SmsSentBroadcastReceiver;
import org.eco.collect.android.tasks.sms.SmsService;
import org.eco.collect.android.tasks.sms.contracts.SmsSubmissionManagerContract;
import org.eco.collect.android.utilities.AuthDialogUtility;
import org.eco.collect.android.utilities.FormListDownloader;
import org.eco.collect.android.utilities.FormDownloader;
import org.eco.collect.android.widgets.ExStringWidget;
import org.eco.collect.android.widgets.QuestionWidget;

import javax.inject.Singleton;

import dagger.BindsInstance;
import dagger.Component;

/**
 * Dagger component for the application. Should include
 * application level Dagger Modules and be built with Application
 * object.
 *
 * Add an `inject(MyClass myClass)` method here for objects you want
 * to inject into so Dagger knows to wire it up.
 *
 * Annotated with @Singleton so modules can include @Singletons that will
 * be retained at an application level (as this an instance of this components
 * is owned by the Application object).
 *
 * If you need to call a provider directly from the component (in a test
 * for example) you can add a method with the type you are looking to fetch
 * (`MyType myType()`) to this interface.
 *
 * To read more about Dagger visit: https://google.github.io/dagger/users-guide
 **/

@Singleton
@Component(modules = {
        AppDependencyModule.class
})
public interface AppDependencyComponent {

    @Component.Builder
    interface Builder {

        @BindsInstance
        Builder application(Application application);

        Builder appDependencyModule(AppDependencyModule testDependencyModule);

        AppDependencyComponent build();
    }

    void inject(Collect collect);

    void inject(SmsService smsService);

    void inject(SmsSender smsSender);

    void inject(SmsSentBroadcastReceiver smsSentBroadcastReceiver);

    void inject(SmsNotificationReceiver smsNotificationReceiver);

    void inject(InstanceUploaderAdapter instanceUploaderAdapter);

    void inject(DataManagerList dataManagerList);

    void inject(PropertyManager propertyManager);

    void inject(FormEntryActivity formEntryActivity);

    void inject(InstanceServerUploaderTask uploader);

    void inject(OpenRosaAPIClient collectClient);

    void inject(ServerPreferencesFragment serverPreferencesFragment);

    void inject(FormDownloader formDownloader);

    void inject(ServerPollingJob serverPollingJob);

    void inject(AuthDialogUtility authDialogUtility);

    void inject(FormDownloadList formDownloadList);

    void inject(InstanceUploaderListActivity activity);

    void inject(GoogleDriveActivity googleDriveActivity);

    void inject(GoogleSheetsUploaderActivity googleSheetsUploaderActivity);

    void inject(QuestionWidget questionWidget);

    void inject(ExStringWidget exStringWidget);

    void inject(ODKView odkView);

    SmsManager smsManager();

    SmsSubmissionManagerContract smsSubmissionManagerContract();

    RxEventBus rxEventBus();

    OpenRosaHttpInterface openRosaHttpInterface();

    FormListDownloader downloadFormListUtils();

    ReferenceManager referenceManager();

    Analytics analytics();
}
