<policies>
    <!-- Throttle, authorize, validate, cache, or transform the requests -->
    <inbound>
        <base />
        <!-- This is the mandatory policies for the API section -->
        <include-fragment fragment-id="correlation-id-inbound" />
        <set-header name="api-name" exists-action="append">
            <value>${api_name}</value>
        </set-header>
        <!-- This is the inbound policies injected by the API section -->
        ${inbound_policies}
    </inbound>
    <!-- Control if and how the requests are forwarded to services  -->
    <backend>
        <base />
    </backend>
    <!-- Customize the responses -->
    <outbound>
        <base />
    </outbound>
    <!-- Handle exceptions and customize error responses  -->
    <on-error>
        <base />
    </on-error>
</policies>