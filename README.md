# Customer Orders Formatting using XML Schema, XML, and XSLT

The html file can be accessed through **[this link](https://dataviz-class-1-dt.s3.us-east-2.amazonaws.com/customerOrders.html)**. 
<br>

I used this project as an opportunity to learn a new programming language. The various programs used for this project are:
* XML Schema
* XML
* XSLT
* HTML

No raw data were used for this projects. I made up the "customer orders" as placeholders to test the useability of my codes. 

## Process

#### XML Schema
I first used XML schema to lay out the structure of the XML document. Using complexTypes, I created the required information for each order using the **sequence** element. In this case, the restrictions are the product information (ie. product name, product description, price, and category), the customer name and phone number. Additional restrictions for each product information inputs are set using **simpleTypes**, which limited the length of characters for the inputs, and allowed only fixed inputs, using the **enumeration elements**, for the product categories

I created a separate schema for the product and customer information and stored a common simpleType restriction in a separate namespace. I then joined the three schemas using **include** and **import** elements. Once the XML structure was built, I inputted a list of product information myself, and transformed the XML document called **Orders.xml**, using **XSLT**, into a **HTML** file. 

#### XSLT
Using XSLT, I converted the XML document built earlier into HTML format, which can then be readable by a web browser. Other than extracting the nodes and attributes from the XML document with XSLT codes, I explored xslt elements like the **for-each** loop, **sort**, **if**, and **choose**, which is essentially the equivalent of the  "switch" function in JavaScript. I also included some bootstrap designs in the XSLT.

#### XPath
I used the XPath to address parts of the XML document. For this project, I selected only the product name and price using the **xsl:template** element. I also indicated using the **xsl:if** element, that products over $500 are eligible for free shipping.
