package org.eco.collect.android.formentry;

import android.net.Uri;

import org.eco.collect.android.tasks.SaveToDiskResult;

public interface FormSaver {
    SaveToDiskResult save(Uri instanceContentURI, boolean shouldFinalize, String updatedSaveName, boolean exitAfter, ProgressListener progressListener);

    interface ProgressListener {
        void onProgressUpdate(String message);
    }
}
