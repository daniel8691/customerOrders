<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:tns="http://www.danieltsai.com/customerOrders"
	xmlns:tns1="http://www.danieltsai.com/commonID" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xsi:schemaLocation="http://www.danieltsai.com/customerOrders customerOrders.xsd ">
	<xsl:template match="/">
		<!-- TODO: Auto-generated template -->
		<html>
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

				<table border="1">
					<tr>
						<th>Product Name</th>
						<th>Product Description</th>
						<th>Price</th>
						<th>Product Category</th>
						<th>Product Class</th>
					</tr>
					<xsl:for-each select="tns:order/tns:Products">
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
			</body>
		</html>


	</xsl:template>
</xsl:stylesheet>