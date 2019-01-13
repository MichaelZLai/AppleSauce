package AppleSauce.com.AppleSauce;


////This sample uses the Apache HTTP client from HTTP Components (http://hc.apache.org/httpcomponents-client-ga/)
import java.net.URI;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.utils.URIBuilder;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;

public class AppleSauce {
	
	
	public static void main(String[] args) {
		
		HttpClient httpclient = HttpClients.createDefault();
	
		
		try {
		    URIBuilder builder = new URIBuilder("https://westus.api.cognitive.microsoft.com/vision/v2.0/describe");
		
		    builder.setParameter("maxCandidates", "1");
		    builder.setParameter("language", "en");
		
		    URI uri = builder.build();
		    HttpPost request = new HttpPost(uri);
		    request.setHeader("Content-Type", "application/json");
		    request.setHeader("Ocp-Apim-Subscription-Key", "dc565dfb55344704879376ec526d78a3");
		    
		    
		    //the image url to parse
		    String picUrl = "https://external-preview.redd.it/buTedlB3cx7z3abjbOpKdJ3alBNms4lErLBy1n_SQaw.jpg?width=960&crop=smart&auto=webp&s=e6dd11a57005f9e99c59c24c9d254049a5a4f297";
		    // Request body
		    StringEntity reqEntity = new StringEntity("{\"url\":\"" + picUrl + "\"}");
		    request.setEntity(reqEntity);
		
		    HttpResponse response = httpclient.execute(request);
		    HttpEntity entity = response.getEntity();
		    
		    if (entity != null) {
		        System.out.println(EntityUtils.toString(entity));
		    }
		}
		catch (Exception e) {
		    System.out.println(e.getMessage());
		}
	}
}
