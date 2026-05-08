package service.gym;

import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Base64;

public class GymTossCancelServiceImpl implements GymTossCancelService {
	private static final String SECRET_KEY = "jPeRRhWK6TshqR4XNjz2ZbcOsCtb04kT6rtxcRuyJXcuLHsCBk1Iqlor00NwpzGrca8UzcEjkyO00cet";
	@Override
	public boolean cancelPayment(String paymentKey, String cancelReason) throws Exception {
		String encodedSecretKey = Base64.getEncoder()
                .encodeToString((SECRET_KEY + ":").getBytes("UTF-8"));

        URL url = new URL(
                "https://api.tosspayments.com/v1/payments/"
                + paymentKey
                + "/cancel"
        );

        HttpURLConnection conn = (HttpURLConnection) url.openConnection();

        conn.setRequestMethod("POST");
        conn.setRequestProperty("Authorization", "Basic " + encodedSecretKey);
        conn.setRequestProperty("Content-Type", "application/json");
        conn.setDoOutput(true);

        String body = "{\"cancelReason\":\"" + cancelReason + "\"}";

        try (OutputStream os = conn.getOutputStream()) {
            os.write(body.getBytes("UTF-8"));
        }

        int responseCode = conn.getResponseCode();

        return responseCode >= 200 && responseCode < 300;
	}

}
