package space.inphinit.flutter_attribution_plugin

import android.content.Context
import com.android.installreferrer.api.InstallReferrerClient
import com.android.installreferrer.api.InstallReferrerStateListener

class AttributionImpl {

    fun getAndroidReferrerUrl(
        context: Context,
        call: (String?, Exception?) -> Unit
    ) {
        val referrerClient = InstallReferrerClient.newBuilder(context).build()

        referrerClient.startConnection(object : InstallReferrerStateListener {
            override fun onInstallReferrerSetupFinished(responseCode: Int) {
                if (responseCode == InstallReferrerClient.InstallReferrerResponse.OK) {
                    try {
                        val referrerDetails = referrerClient.installReferrer
                        val referrerUrl = referrerDetails.installReferrer

                        call(referrerUrl, null)
                    } catch (e: Exception) {
                        call(null, e)
                    } finally {
                        referrerClient.endConnection()
                    }
                } else {
                    call(
                        null,
                        Exception(
                            "Install Referrer API failed with code: $responseCode"
                        )
                    )
                }
            }

            override fun onInstallReferrerServiceDisconnected() {
                // Can retry if needed
            }
        })
    }
}