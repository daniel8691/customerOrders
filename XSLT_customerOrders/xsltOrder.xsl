<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:tns="http://www.danieltsai.com/customerOrders" 
	xmlns:tns1="http://www.danieltsai.com/commonID" 
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" 
	xsi:schemaLocation="http://www.danieltsai.com/customerOrders customerOrders.xsd ">
	<xsl:template match="/">
		<!-- TODO: Auto-generated template -->
		<html>
			<body>
				<h2>Order Information</h2>
				<h3>
					<xsl:value-of select="tns:order/tns:customer/tns:name" />
				</h3>
				<h3>
					<xsl:value-of select="tns:order/@id" />
				</h3>
			</body>
		</html>


	</xsl:template>
</xsl:stylesheet>