# tokenRedirect
Bash script performing consecutive requests, grabing a unique token from the first response (should be from the login request) to send it along with the next requests.

The requests are curl based and already configured to set the following actions:

<ul>
<li>&nbsp;Sending POST requests with non-multipart data.</li>
<li>&nbsp;Setting the desired HTTP headers.</li>
<li>&nbsp;Sending all requests to a proxy (usefull to send to burp.</li>
<li>&nbsp;Each request has a loop option, allowing to add a dictionary to performe a brute-force attack.
<ul>

By default the request are empty and you need to set them up for your target.
Speed of the brute-force attack can be modified by changing the value of the sleep function which is written in seconds (it works with decimals).
