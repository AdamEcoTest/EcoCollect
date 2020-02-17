package org.eco.collect.android.formentry.media;

import android.content.Context;

import org.eco.collect.android.audio.AudioHelper;

public interface AudioHelperFactory {

    AudioHelper create(Context context);
}
