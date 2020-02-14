<?xml version="1.0" encoding="UTF-8"?> 
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"> 
<xsl:template match="/"> 

<html> 
<head>
<style>
#formularios {
  font-family: Arial;
  border-collapse: collapse;
  width: 100%;
  margin-bottom: 40px;
}

#formularios td, #formularios th {
  border: 1px solid #ddd;
  padding: 8px;
}

#formularios td:nth-of-type(1) {
  background-color: #f2f2f2;
  width: 200px;
}

#formularios tr:nth-of-type(1) {
  background-color: #f2f2f2;
  font-size: 130%;
  font-weight: bold;
}


</style>
</head>
<body> 

	<xsl:choose>
		<xsl:when test="/*/@id = 'ficha_19'">
			<img src="file:///android_res/drawable/logo_ecociencia.png"/>
			<h1 align="center">42 - Registro y reacción ante presiones</h1> 
				<table id="formularios">
					<tr> 
						<td colspan="2">Datos del evento</td> 
					</tr>
					<tr> 
						<td>Tipo de presion o amenaza</td> 
						<td><xsl:value-of select="ficha_42/datos_press/press"/></td> 
					</tr> 
					<tr>
						<td>Nombre del veedor</td> 
						<td><xsl:value-of select="ficha_42/datos_press/veedor"/></td> 
					</tr>
					<tr>
						<td>Comunidad</td> 
						<td><xsl:value-of select="ficha_42/datos_press/comunidad"/></td> 
					</tr>
					<tr>
						<td>Fecha del evento</td> 
						<td><xsl:value-of select="ficha_42/datos_press/fecha"/></td> 
					</tr>
					<tr>
						<td>Hora del evento</td> 
						<td><xsl:value-of select="ficha_42/datos_press/hora"/></td> 
					</tr>
					<tr>
						<td>Tomar punto GPS</td> 
						<td><xsl:value-of select="ficha_42/datos_press/coordenadas"/></td> 
					</tr>
					<tr>
						<td>Descripción del Sitio</td> 
						<td><xsl:value-of select="ficha_42/datos_press/descripcion_sitio"/></td> 
					</tr>
					<tr>
						<td>Nombre del causante</td> 
						<td><xsl:value-of select="ficha_42/datos_press/causante_nombre"/></td> 
					</tr>
					<tr>
						<td>Tomar foto</td> 
						<td><xsl:value-of select="ficha_42/datos_press/foto"/></td>
					</tr>
					<tr>
						<td>Número de cédula</td> 
						<td><xsl:value-of select="ficha_42/datos_press/cedula"/></td> 
					</tr>
				</table>
				
				<table id="formularios">
					<tr>
						<td colspan="2">Categoria de fauna</td> 
					</tr>
					<tr>
						<td>Tipo de fauna / animales</td> 
						<td><xsl:value-of select="ficha_42/comienzo_categoria_fauna/fauna/tipo_fauna"/></td> 
					</tr>
					<tr>
						<td>Capturado</td> 
						<td><xsl:value-of select="ficha_42/comienzo_categoria_fauna/fauna/captura"/></td> 
					</tr>
					<tr>
						<td>¿Captura para...?</td> 
						<td><xsl:value-of select="ficha_42/comienzo_categoria_fauna/fauna/captura_fauna"/></td> 
					</tr>
					<tr>
						<td><b>Nombre de la especie</b></td> 
						<td></td> 
					</tr>
					<tr>
						<td>------> Nombre Wao</td> 
						<td><xsl:value-of select="ficha_42/comienzo_categoria_fauna/fauna/nombre_especie_1/nombre_wao"/></td> 
					</tr>
					<tr>
						<td>------> Nombre Español</td> 
						<td><xsl:value-of select="ficha_42/comienzo_categoria_fauna/fauna/nombre_especie_1/nombre_espanol"/></td> 
					</tr>
					<tr>
						<td>------> Nombre Latin</td> 
						<td><xsl:value-of select="ficha_42/comienzo_categoria_fauna/fauna/nombre_especie_1/nombre_latin"/></td> 
					</tr>
					<tr>
						<td>Edad de la especie</td> 
						<td><xsl:value-of select="ficha_42/comienzo_categoria_fauna/fauna/edad_fauna"/></td> 
					</tr>
					<tr>
						<td>Sexo de la especie</td> 
						<td><xsl:value-of select="ficha_42/comienzo_categoria_fauna/fauna/sexo_fauna"/></td> 
					</tr>
					<tr>
						<td>Observaciones</td> 
						<td><xsl:value-of select="ficha_42/comienzo_categoria_fauna/fauna/observacion"/></td> 
					</tr>
				</table>
				
				<table id="formularios">
					<tr>
						<td colspan="2">Categoria flora / plantas</td> 
					</tr>
					<tr>
						<td>Observación</td> 
						<td><xsl:value-of select="ficha_42/flora/comienzo_categoria_flora/observacion"/></td> 
					</tr>
					<tr>
						<td>Uso / ¿Captura para...?</td> 
						<td><xsl:value-of select="ficha_42/flora/comienzo_categoria_flora/captura_flora"/></td> 
					</tr>
					<tr>
						<td><b>Nombre de la especie</b></td> 
						<td></td> 
					</tr>
					<tr>
						<td>----> Nombre Wao</td> 
						<td><xsl:value-of select="ficha_42/flora/comienzo_categoria_flora/nombre_especie_2/nombre_wao"/></td> 
					</tr>
					<tr>
						<td>----> Nombre Español</td> 
						<td><xsl:value-of select="ficha_42/flora/comienzo_categoria_flora/nombre_especie_2/nombre_espanol"/></td> 
					</tr>
					<tr>
						<td>----> Nombre Latin</td> 
						<td><xsl:value-of select="ficha_42/flora/comienzo_categoria_flora/nombre_especie_2/nombre_latin"/></td> 
					</tr>
					<tr>
						<td>Parte de la flora usada</td> 
						<td><xsl:value-of select="ficha_42/flora/comienzo_categoria_flora/parte_usada"/></td> 
					</tr>
					<tr>
						<td>Cantidad</td> 
						<td><xsl:value-of select="ficha_42/flora/comienzo_categoria_flora/cantidad"/></td> 
					</tr>
					<tr>
						<td>Peso</td> 
						<td><xsl:value-of select="ficha_42/flora/comienzo_categoria_flora/peso"/></td> 
					</tr>
				</table>
					
				<table id="formularios">
					<tr>
						<td colspan="2">Tala</td> 
					</tr>
					<tr>
						<td>Observación</td> 
						<td><xsl:value-of select="ficha_42/tala/comienza_categoria_tala/observacion"/></td> 
					</tr>
					<tr>
						<td>¿Cortado para...?</td> 
						<td><xsl:value-of select="ficha_42/tala/comienza_categoria_tala/uso_tala"/></td> 
					</tr>
					<tr>
						<td><b>Nombre de la especie</b></td> 
						<td></td> 
					</tr>
					<tr>
						<td>----> Nombre Wao</td> 
						<td><xsl:value-of select="ficha_42/tala/comienza_categoria_tala/nombre_especie_3/nombre_wao"/></td> 
					</tr>
					<tr>
						<td>----> Nombre Español</td> 
						<td><xsl:value-of select="ficha_42/tala/comienza_categoria_tala/nombre_especie_3/nombre_espanol"/></td> 
					</tr>
					<tr>
						<td>----> Nombre Latin</td> 
						<td><xsl:value-of select="ficha_42/tala/comienza_categoria_tala/nombre_especie_3/nombre_latin"/></td> 
					</tr>
					<tr>
						<td><b>Medidas</b></td> 
						<td></td> 
					</tr>
					<tr>
						<td>----> Alto del árbol</td> 
						<td><xsl:value-of select="ficha_42/tala/comienza_categoria_tala/medidas/alto"/></td> 
					</tr>
					<tr>
						<td>----> Grueso del árbol / DAP</td> 
						<td><xsl:value-of select="ficha_42/tala/comienza_categoria_tala/medidas/grueso"/></td> 
					</tr>
					<tr>
						<td>----> Área clareada caída</td> 
						<td><xsl:value-of select="ficha_42/tala/comienza_categoria_tala/medidas/area_clareada"/></td> 
					</tr>
				</table>
				
				<table id="formularios">
					<tr>
						<td colspan="2">Deforestación</td> 
					</tr>
					<tr>
						<td>Calcular el área de deforestación</td> 
						<td><xsl:value-of select="ficha_42/comienza_categoria_deforestacion/cat_deforestacion/shape"/></td> 
					</tr>
					<tr>
						<td>El área de deforestación</td> 
						<td><xsl:value-of select="ficha_42/comienza_categoria_deforestacion/cat_deforestacion/shape_area"/></td> 
					</tr>
					<tr>
						<td>¿Deforestado para...?</td> 
						<td><xsl:value-of select="ficha_42/comienza_categoria_deforestacion/cat_deforestacion/uso_def"/></td> 
					</tr>
					<tr>
						<td><b>Tipo de habitat / tipo de bosque afectado</b></td> 
						<td></td> 
					</tr>
					<tr>
						<td>----> Habitat de la deforestación</td> 
						<td><xsl:value-of select="ficha_42/comienza_categoria_deforestacion/cat_deforestacion/comienza_habitat/habitat_def"/></td> 
					</tr>
					<tr>
						<td>Observaciones</td> 
						<td><xsl:value-of select="ficha_42/comienza_categoria_deforestacion/cat_deforestacion/observacion"/></td> 
					</tr>		
				</table> 
				
				<table id="formularios">
					<tr>
						<td colspan="2">Contaminación</td> 
					</tr>
					<tr>
						<td><b>Derrame de aceite</b></td> 
						<td></td>
					</tr>
					<tr>
						<td>----> Contaminación en</td> 
						<td><xsl:value-of select="ficha_42/comienza_categoria_contaminacion/categoria_contaminacion/comienza_contaminacion_aceite/tipo_derrame"/></td> 
					</tr>
					<tr>
						<td>----> Lugar donde ocurrió</td> 
						<td><xsl:value-of select="ficha_42/comienza_categoria_contaminacion/categoria_contaminacion/comienza_contaminacion_aceite/lugar"/></td> 
					</tr>
					<tr>
						<td>----> Cantidad de derrame de aceite</td> 
						<td><xsl:value-of select="ficha_42/comienza_categoria_contaminacion/categoria_contaminacion/comienza_contaminacion_aceite/cantidad"/></td> 
					</tr>
					<tr>
						<td>----> Otras observaciones</td> 
						<td><xsl:value-of select="ficha_42/comienza_categoria_contaminacion/categoria_contaminacion/comienza_contaminacion_aceite/otras_observaciones"/></td> 
					</tr>
					<tr>
						<td><b>Derrame de petróleo</b></td> 
						<td></td>
					</tr>
					<tr>
						<td>----> Que se derramó</td> 
						<td><xsl:value-of select="ficha_42/comienza_categoria_contaminacion/categoria_contaminacion/comienza_contaminacion_petroleo/derrame"/></td> 
					</tr>
					<tr>
						<td>----> Cual petrolera fue la causante</td> 
						<td><xsl:value-of select="ficha_42/comienza_categoria_contaminacion/categoria_contaminacion/comienza_contaminacion_petroleo/petrolera"/></td> 
					</tr>
					<tr>
						<td>----> Observaciones del derrame</td> 
						<td><xsl:value-of select="ficha_42/comienza_categoria_contaminacion/categoria_contaminacion/comienza_contaminacion_petroleo/observacion"/></td> 
					</tr>
					<tr>
						<td>----> Que componente se vió afectado</td> 
						<td><xsl:value-of select="ficha_42/comienza_categoria_contaminacion/categoria_contaminacion/comienza_contaminacion_petroleo/derrame_afec"/></td> 
					</tr>
					<tr>
						<td><b>Envenenamiento de río</b></td> 
						<td></td>
					</tr>
					<tr>
						<td>----> Quien es el responsable del envenenamiento</td> 
						<td><xsl:value-of select="ficha_42/comienza_categoria_contaminacion/categoria_contaminacion/comienza_contaminacion_envenenamiento/causante"/></td> 
					</tr>
					<tr>
						<td>----> Que fue lo que envenenó</td> 
						<td><xsl:value-of select="ficha_42/comienza_categoria_contaminacion/categoria_contaminacion/comienza_contaminacion_envenenamiento/envenenamiento"/></td> 
					</tr>
					<tr>
						<td>----> Con que motivo envenenó</td> 
						<td><xsl:value-of select="ficha_42/comienza_categoria_contaminacion/categoria_contaminacion/comienza_contaminacion_envenenamiento/envenena_motivo"/></td> 
					</tr>
					<tr>
						<td>Observaciones</td> 
						<td><xsl:value-of select="ficha_42/comienza_categoria_contaminacion/categoria_contaminacion/observaciones"/></td> 
					</tr>					
				</table> 
				
				<table id="formularios">
					<tr>
						<td colspan="2">Invasión de tierras Waorani</td> 
					</tr>
					<tr>
						<td>Calcular el área de deforestación</td> 
						<td><xsl:value-of select="ficha_42/comienza_categoria_invasion/invasion/shape1"/></td> 
					</tr>
					<tr>
						<td>El area de invasión</td> 
						<td><xsl:value-of select="ficha_42/comienza_categoria_invasion/invasion/shape1_area"/></td> 
					</tr>
					<tr>
						<td>Habitat de la invasión</td> 
						<td><xsl:value-of select="ficha_42/comienza_categoria_invasion/invasion/habitat_def"/></td> 
					</tr>
					<tr>
						<td>Observaciones</td> 
						<td><xsl:value-of select="ficha_42/comienza_categoria_invasion/invasion/observaciones"/></td> 
					</tr>
				</table> 
				
				<table id="formularios">
					<tr>
						<td colspan="2">Registre la denuncia</td> 
					</tr>
					<tr>
						<td>Acción recomendada</td> 
						<td><xsl:value-of select="ficha_42/comienza_registro_denuncia/ultimo_grupo/accion_recomendada"/></td> 
					</tr>
					<tr>
						<td>Firma veedor en celular</td> 
						<td><xsl:value-of select="ficha_42/comienza_registro_denuncia/ultimo_grupo/firma_veedor"/></td> 
					</tr>
					<tr>
						<td>Firma veedor en papel</td> 
						<td></td> 
					</tr>
					<tr>
						<td>Firma del presidente de la comunidad en celular</td> 
						<td><xsl:value-of select="ficha_42/comienza_registro_denuncia/ultimo_grupo/firma_presidente_comudidad"/></td> 
					</tr>
					<tr>
						<td>Firma del presidente de la comunidad en papel</td> 
						<td></td> 
					</tr>
				</table>
		</xsl:when>
		<xsl:otherwise>
			<h1 align="center">No se puede imprimir esta plantilla de formulario: comuníquese con un desarrollador de EcoCiencia para agregarla al XSLT</h1>
		</xsl:otherwise>
	</xsl:choose>
</body> 
</html> 
</xsl:template> 
</xsl:stylesheet> 