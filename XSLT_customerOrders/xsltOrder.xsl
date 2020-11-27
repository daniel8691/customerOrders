<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:tns="http://www.danieltsai.com/customerOrders"
	xmlns:tns1="http://www.danieltsai.com/commonID" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xsi:schemaLocation="http://www.danieltsai.com/customerOrders customerOrders.xsd ">
	<xsl:template match="/">
		<!-- TODO: Auto-generated template -->
		<html>
			<head>

				<meta charset='utf-8' />
				<meta http-equiv='X-UA-Compatible' content='IE=edge' />
				<meta name='viewport' content='width=device-width, initial-scale=1' />
				<!-- CSS -->
				<link rel="stylesheet"
					href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
					integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
					crossorigin="anonymous" />

				<!-- jQuery and JS bundle w/ Popper.js -->
				<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
					integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
					crossorigin="anonymous"></script>
				<script
					src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
					integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
					crossorigin="anonymous"></script>
				<title>Customer Order Info</title>
			</head>
			<body>
				<h2>Order Information</h2>
				<h3>
					Customer Name:
					<xsl:value-of select="tns:order/tns:customer/tns:name" />
				</h3>
				<h3>
					Customer ID:
					<xsl:value-of select="tns:order/@id" />
				</h3>

				<table class="table table-striped">
					<tr>
						<th>Product Name</th>
						<th>Product Description</th>
						<th>Price</th>
						<th>Product Category</th>
						<th>Product Class</th>
					</tr>
					<!-- Iterate through products within the order using for-each -->
					<xsl:for-each select="tns:order/tns:Products">
						<!-- Sort the table values by the price in descending order -->
						<xsl:sort select="tns:price" data-type="number" order="descending" />
						<tr>
							<td>
								<xsl:value-of select="tns:name" />
							</td>
							<td>
								<xsl:value-of select="tns:description" />
							</td>
							<td>
								<xsl:value-of select="tns:price" />
							</td>
							<td>
								<xsl:value-of select="tns:category" />
							</td>
							<td>
								<xsl:choose>
									<xsl:when test="tns:price>=1500">
										<p>Luxury</p>
									</xsl:when>

									<xsl:when test="tns:price>=1000">
										<p>Standard</p>
									</xsl:when>

									<xsl:otherwise>
										<p>Cheap</p>
									</xsl:otherwise>

								</xsl:choose>
							</td>


						</tr>
					</xsl:for-each>
				</table>
				<div class="jumbotron jumbotron-fluid m-xs-3 p-xs-1 m-sm-5 p-sm-5">
					<h2 style="text-align:center;">Calling elements using XPath</h2>
					<xsl:apply-templates />
					<br />
					<p>
						Total number of items in the order:
						<xsl:value-of select="count(/tns:order/tns:Products)" />
					</p>
					<p>
						Total price of the order:
						<xsl:value-of select="sum(/tns:order/tns:Products/tns:price)" />
					</p>
				</div>

			</body>
		</html>

	</xsl:template>

	<xsl:template match="tns:customer">
		<b>Customer Name &amp; Phone Number:</b>
		<p>
			<xsl:value-of select="." />
		</p>

	</xsl:template>


	<xsl:template match="tns:Products">
		<b>
			Order ID:
			<xsl:value-of select="../@id" />
		</b>
		<p>
			Product:
			<xsl:value-of select="./tns:name" />
			<br />
			Price:
			<xsl:value-of select="./tns:price" />
			<xsl:if test="tns:price &gt; 500">
				(eligible for free shipping)
			</xsl:if>
			<xsl:if test="tns:price &lt; 500">
				(free shipping for products priced higher than 500)
			</xsl:if>

		</p>
	</xsl:template>

</xsl:stylesheet>