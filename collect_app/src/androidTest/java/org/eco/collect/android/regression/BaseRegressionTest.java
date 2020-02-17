package org.eco.collect.android.regression;

import androidx.test.rule.ActivityTestRule;

import org.junit.Rule;
import org.eco.collect.android.activities.MainMenuActivity;

public class BaseRegressionTest {

    @Rule
    public ActivityTestRule<MainMenuActivity> rule = new ActivityTestRule<>(MainMenuActivity.class);
}