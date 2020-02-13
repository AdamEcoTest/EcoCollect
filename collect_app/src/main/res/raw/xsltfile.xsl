<?xml version="1.0" encoding="UTF-8"?> 
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"> 
<xsl:template match="/"> 

<html> 
<body> 
	<xsl:choose>
		<xsl:when test="/*/@id = 'ficha_19'">
			<h1 align="center">Adam Test</h1> 
			<table style = "width:100%" border="3" align="center" >		
				<tr> 
					<th>Question</th> 
					<th>Answer</th> 
				</tr> 
				<tr> 
					<td>Start time</td> 
					<td><xsl:value-of select="ficha_42/start"/></td> 
				</tr> 
				<tr>
					<td>Device ID</td> 
					<td><xsl:value-of select="ficha_42/deviceid"/></td> 
				</tr>
				<tr>
					<td>Press</td> 
					<td><xsl:value-of select="ficha_42/datos_press/press"/></td> 
				</tr>
				<tr>
					<td>Nombre de veedor</td> 
					<td><xsl:value-of select="ficha_42/datos_press/veedor"/></td> 
				</tr>
				<tr>
					<td>Comunidad</td> 
					<td><xsl:value-of select="ficha_42/datos_press/comunidad"/></td> 
				</tr>
				<tr>
					<td>Fecha</td> 
					<td><xsl:value-of select="ficha_42/datos_press/fecha"/></td> 
				</tr>
				<tr>
					<td>Hora</td> 
					<td><xsl:value-of select="ficha_42/datos_press/hora"/></td> 
				</tr>
				<tr>
					<td>Coordenadas</td> 
					<td><xsl:value-of select="ficha_42/datos_press/coordenadas"/></td> 
				</tr>
				<tr>
					<td>Descripcion de sitio</td> 
					<td><xsl:value-of select="ficha_42/datos_press/descripcion_sitio"/></td> 
				</tr>
				<tr>
					<td>Nombre de causante</td> 
					<td><xsl:value-of select="ficha_42/datos_press/causante_nombre"/></td> 
				</tr>
				<tr>
					<td>Evento de causante</td> 
					<td><xsl:value-of select="ficha_42/datos_press/causante_evento"/></td> 
				</tr>
				<tr>
					<td>Foto</td> 
					<td><xsl:value-of select="ficha_42/datos_press/foto"/></td> 
				</tr>
				<tr>
					<td>Cedula</td> 
					<td><xsl:value-of select="ficha_42/datos_press/cedula"/></td> 
				</tr>
				<tr>
					<td bgcolor="lightgray"><b>Categoria de fauna</b></td> 
					<td bgcolor="lightgray"><xsl:value-of select="ficha_42/comienzo_categoria_fauna/fauna/categoria_fauna"/></td> 
				</tr>
				<tr>
					<td>Tipo de fauna</td> 
					<td><xsl:value-of select="ficha_42/comienzo_categoria_fauna/fauna/tipo_fauna"/></td> 
				</tr>
				<tr>
					<td>Captura</td> 
					<td><xsl:value-of select="ficha_42/comienzo_categoria_fauna/fauna/captura"/></td> 
				</tr>
				<tr>
					<td>Captura Fauna</td> 
					<td><xsl:value-of select="ficha_42/comienzo_categoria_fauna/fauna/captura_fauna"/></td> 
				</tr>
				<tr>
					<td>Nombre de especie</td> 
					<td><xsl:value-of select="ficha_42/comienzo_categoria_fauna/fauna/nombre_especie_1"/></td> 
				</tr>
				<tr>
					<td>Nombre Wao</td> 
					<td><xsl:value-of select="ficha_42/comienzo_categoria_fauna/fauna/nombre_especie_1/nombre_wao"/></td> 
				</tr>
				<tr>
					<td>Nombre Espanol</td> 
					<td><xsl:value-of select="ficha_42/comienzo_categoria_fauna/fauna/nombre_especie_1/nombre_espanol"/></td> 
				</tr>
				<tr>
					<td>Nombre Latin</td> 
					<td><xsl:value-of select="ficha_42/comienzo_categoria_fauna/fauna/nombre_especie_1/nombre_latin"/></td> 
				</tr>
				<tr>
					<td>Firma</td> 
					<td> </td> 
				</tr>
			</table> 
		</xsl:when>
		<xsl:otherwise>
			<h1 align="center">Unable to print this Form Template - please contact a developer to add it to the XSLT</h1>
		</xsl:otherwise>
	</xsl:choose>
</body> 
</html> 
</xsl:template> 
</xsl:stylesheet> 