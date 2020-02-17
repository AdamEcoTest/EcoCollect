package org.eco.collect.android.injection.config;

import android.app.Application;
import android.content.Context;
import android.telephony.SmsManager;
import android.webkit.MimeTypeMap;

import org.javarosa.core.reference.ReferenceManager;
import org.eco.collect.android.analytics.Analytics;
import org.eco.collect.android.analytics.FirebaseAnalytics;
import org.eco.collect.android.dao.FormsDao;
import org.eco.collect.android.dao.InstancesDao;
import org.eco.collect.android.events.RxEventBus;
import org.eco.collect.android.formentry.media.AudioHelperFactory;
import org.eco.collect.android.formentry.media.ScreenContextAudioHelperFactory;
import org.eco.collect.android.openrosa.OpenRosaAPIClient;
import org.eco.collect.android.openrosa.CollectThenSystemContentTypeMapper;
import org.eco.collect.android.openrosa.OpenRosaHttpInterface;
import org.eco.collect.android.openrosa.okhttp.OkHttpConnection;
import org.eco.collect.android.openrosa.okhttp.OkHttpOpenRosaServerClientProvider;
import org.eco.collect.android.tasks.sms.SmsSubmissionManager;
import org.eco.collect.android.tasks.sms.contracts.SmsSubmissionManagerContract;
import org.eco.collect.android.utilities.ActivityAvailability;
import org.eco.collect.android.utilities.AndroidUserAgent;
import org.eco.collect.android.utilities.FormListDownloader;
import org.eco.collect.android.utilities.PermissionUtils;
import org.eco.collect.android.utilities.WebCredentialsUtils;
import org.eco.collect.utilities.UserAgentProvider;

import javax.inject.Singleton;

import dagger.Module;
import dagger.Provides;
import okhttp3.OkHttpClient;

/**
 * Add dependency providers here (annotated with @Provides)
 * for objects you need to inject
 */
@Module
public class AppDependencyModule {

    @Provides
    public SmsManager provideSmsManager() {
        return SmsManager.getDefault();
    }

    @Provides
    SmsSubmissionManagerContract provideSmsSubmissionManager(Application application) {
        return new SmsSubmissionManager(application);
    }

    @Provides
    Context context(Application application) {
        return application;
    }

    @Provides
    public InstancesDao provideInstancesDao() {
        return new InstancesDao();
    }

    @Provides
    public FormsDao provideFormsDao() {
        return new FormsDao();
    }

    @Provides
    @Singleton
    RxEventBus provideRxEventBus() {
        return new RxEventBus();
    }

    @Provides
    MimeTypeMap provideMimeTypeMap() {
        return MimeTypeMap.getSingleton();
    }

    @Provides
    @Singleton
    public UserAgentProvider providesUserAgent() {
        return new AndroidUserAgent();
    }

    @Provides
    @Singleton
    OpenRosaHttpInterface provideHttpInterface(MimeTypeMap mimeTypeMap, UserAgentProvider userAgentProvider) {
        return new OkHttpConnection(
                new OkHttpOpenRosaServerClientProvider(new OkHttpClient()),
                new CollectThenSystemContentTypeMapper(mimeTypeMap),
                userAgentProvider.getUserAgent()
        );
    }

    @Provides
    public OpenRosaAPIClient provideCollectServerClient(OpenRosaHttpInterface httpInterface, WebCredentialsUtils webCredentialsUtils) {
        return new OpenRosaAPIClient(httpInterface, webCredentialsUtils);
    }

    @Provides
    WebCredentialsUtils provideWebCredentials() {
        return new WebCredentialsUtils();
    }

    @Provides
    FormListDownloader provideDownloadFormListDownloader(
            Application application,
            OpenRosaAPIClient openRosaAPIClient,
            WebCredentialsUtils webCredentialsUtils,
            FormsDao formsDao) {
        return new FormListDownloader(
                application,
                openRosaAPIClient,
                webCredentialsUtils,
                formsDao
        );
    }

    @Provides
    @Singleton
    public Analytics providesAnalytics(Application application) {
        com.google.firebase.analytics.FirebaseAnalytics firebaseAnalyticsInstance = com.google.firebase.analytics.FirebaseAnalytics.getInstance(application);
        FirebaseAnalytics firebaseAnalytics = new FirebaseAnalytics(firebaseAnalyticsInstance);

        return new Analytics() {
            @Override
            public void logEvent(String category, String action) {
                firebaseAnalytics.logEvent(category, action);
            }

            @Override
            public void logEvent(String category, String action, String label) {
                firebaseAnalytics.logEvent(category, action, label);
            }
        };
    }

    @Provides
    public PermissionUtils providesPermissionUtils() {
        return new PermissionUtils();
    }

    @Provides
    public ReferenceManager providesReferenceManager() {
        return ReferenceManager.instance();
    }

    @Provides
    public AudioHelperFactory providesAudioHelperFactory() {
        return new ScreenContextAudioHelperFactory();
    }

    @Provides
    public ActivityAvailability providesActivityAvailability(Context context) {
        return new ActivityAvailability(context);
    }
}
