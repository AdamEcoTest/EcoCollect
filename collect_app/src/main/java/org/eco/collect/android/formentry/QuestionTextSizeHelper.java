package org.eco.collect.android.formentry;

import org.eco.collect.android.preferences.GeneralSharedPreferences;

import static org.eco.collect.android.preferences.GeneralKeys.KEY_FONT_SIZE;

public class QuestionTextSizeHelper {

    public float getHeadline6() {
        return getBaseFontSize() - 1; // 20sp by default
    }

    public float getSubtitle1() {
        return getBaseFontSize() - 5; // 16sp by default
    }

    private int getBaseFontSize() {
        return Integer.parseInt(String.valueOf(GeneralSharedPreferences.getInstance().get(KEY_FONT_SIZE)));
    }
}
