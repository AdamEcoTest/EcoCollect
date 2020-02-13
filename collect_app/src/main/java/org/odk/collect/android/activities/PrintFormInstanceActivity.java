package org.odk.collect.android.activities;

import android.app.Activity;
import android.content.Context;
import android.os.Bundle;
import android.print.PrintAttributes;
import android.print.PrintDocumentAdapter;
import android.print.PrintJob;
import android.print.PrintManager;
import android.util.Log;
import android.view.Window;
import android.webkit.WebView;
import android.webkit.WebViewClient;

import org.odk.collect.android.R;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.StringWriter;
import java.io.UnsupportedEncodingException;

import javax.xml.transform.Result;
import javax.xml.transform.Source;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerConfigurationException;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.TransformerFactoryConfigurationError;
import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.stream.StreamSource;

public class PrintFormInstanceActivity extends Activity {
    public static final String TAG = "YOUR-TAG-NAME";
    private WebView mWebView;
    /**
     * Called when the activity is first created.
     */
    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        getWindow().requestFeature(Window.FEATURE_PROGRESS);

        WebView webview = new WebView(this);
        setContentView(webview);

        //Reading XSLT
        String strXSLT = GetStyleSheet(R.raw.xsltfile);
        //Reading XML
        String strXML = GetStyleSheet(R.raw.xmlfile);
        /*
         * Loading XSLT...
         */
        //Transform ...
        String html = StaticTransform(strXSLT, strXML);


        //Loading the above transformed XSLT in to Webview...
        webview.loadData(html, "text/html", null);


        WebView webView = new WebView(this);
        webView.setWebViewClient(new WebViewClient() {

            public boolean shouldOverrideUrlLoading(WebView view, String url) {
                return false;
            }

            @Override
            public void onPageFinished(WebView view, String url) {
                Log.i(TAG, "page finished loading " + url);
                createWebPrintJob(view);
                mWebView = null;
            }
        });

        webView.loadDataWithBaseURL(null, html, "text/HTML", "UTF-8", null);

        mWebView = webView;


    }

    private void createWebPrintJob(WebView webView) {

        // Get a PrintManager instance
        PrintManager printManager = (PrintManager) this
                .getSystemService(Context.PRINT_SERVICE);

        String jobName = getString(R.string.app_name) + " Document";

        // Get a print adapter instance
        PrintDocumentAdapter printAdapter = webView.createPrintDocumentAdapter(jobName);

        // Set default page size to A4
        PrintAttributes.Builder builder = new PrintAttributes.Builder();
        builder.setMediaSize( PrintAttributes.MediaSize.ISO_A4);

        // Create a print job with name and adapter instance
        PrintJob printJob = printManager.print(jobName, printAdapter, builder.build());


        // Save the job object for later status checking
        // printJobs.add(printJob);
    }

    /*
     * Transform XSLT to HTML string
     */
    public static String StaticTransform(String strXsl, String strXml) {
        String html = "";

        try {

            InputStream ds = null;
            ds = new ByteArrayInputStream(strXml.getBytes("UTF-8"));

            Source xmlSource = new StreamSource(ds);

            InputStream xs = new ByteArrayInputStream(strXsl.getBytes("UTF-8"));
            Source xsltSource = new StreamSource(xs);

            StringWriter writer = new StringWriter();
            Result result = new StreamResult(writer);
            TransformerFactory tFactory = TransformerFactory.newInstance();
            Transformer transformer = tFactory.newTransformer(xsltSource);
            transformer.transform(xmlSource, result);

            html = writer.toString();

            ds.close();
            xs.close();

            xmlSource = null;
            xsltSource = null;

        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        } catch (TransformerConfigurationException e) {
            e.printStackTrace();
        } catch (TransformerFactoryConfigurationError e) {
            e.printStackTrace();
        } catch (TransformerException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return html;
    }

    /*
     * Read file from res/raw...
     */
    private String GetStyleSheet(int fileId) {
        String strXsl = null;

        InputStream raw = getResources().openRawResource(fileId);
        ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
        int size = 0;
        // Read the entire resource into a local byte buffer.
        byte[] buffer = new byte[1024];
        try {
            while ((size = raw.read(buffer, 0, 1024)) >= 0) {
                outputStream.write(buffer, 0, size);
            }
            raw.close();

            strXsl = outputStream.toString();

            Log.v("Log", "xsl ==> " + strXsl);
        } catch (IOException e) {
            e.printStackTrace();
        }

        return strXsl;

    }
}
