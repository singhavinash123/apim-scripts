$apimService = "alphagx-daytrader-apim-service"
$apimResourceGroup = "alphagx-daytrader-apim-rg"
$productId="daytrader-product-alphagx"

#$apiId="62a9341fe4c94f3c91b5aac103228400"
$apimContext = New-AzApiManagementContext -ResourceGroupName $apimResourceGroup -ServiceName $apimService 

$productValid = '<policies> 
    <inbound> 
	<rate-limit-by-key calls="4" renewal-period="10" counter-key="@(context.Subscription?.Id)" increment-condition="@(context.Response.StatusCode >= 200)" />
<quota-by-key calls="10" bandwidth="7000" renewal-period="3600" counter-key="@(context.Request.IpAddress)" /> 
      
<check-header name="Ocp-Apim-Subscription-Key" failed-check-httpcode="401" failed-check-error-message="Not authorized" ignore-case="false"> 
<value>dc00a02b88f54be1bb23409b26d9f8aa</value> 
</check-header> 

<ip-filter action="forbid"> 
<address-range from="106.51.104.249" to="106.51.104.252" /> 
<address>106.51.104.249</address> 
</ip-filter> 
	  <base /> 
    </inbound> 
    <outbound> 
	<choose> 

<when condition="@(context.Response.StatusCode >= 200)"> 

<send-one-way-request mode="new"> 

<set-url>https://enjqjdg3mr55g81.m.pipedream.net</set-url> 

<set-method>POST</set-method> 

<set-body>@{ 

return new JObject( 

new JProperty("username",context.Subscription.Id), 

new JProperty("urlPath",context.Request.Url.Path + context.Request.Url.QueryString), 

new JProperty("host",context.Request.Url.Host), 

new JProperty("statusCode",context.Response.StatusCode) 

).ToString(); 

}</set-body> 

</send-one-way-request> 

</when> 

</choose> 

<set-header name="X-Powered-By" exists-action="delete" />
<redirect-content-urls />
        <base /> 
    </outbound> 

    <backend> 
        <base /> 
    </backend> 

    <on-error> 
        <base /> 
    </on-error> 

</policies>' 

#Set-AzApiManagementPolicy -Context $apimContext -ApiId $apiId -Policy $productValid 

Set-AzApiManagementPolicy -Context $apimContext  -Policy $productValid -ProductId $productId -PassThru