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

h1  {
  text-align: center;
   margin-bottom: 40px;
}


</style>
</head>
<body> 

	<xsl:choose>
	    <!-- '42_Registro y reacción ante presiones' Form -->
		<xsl:when test="/*/@id = 'ficha_19'">
		
		    <!-- Finding the path directory for the photos -->
            <xsl:variable name="instancefolderfirst19" select="substring(ficha_42/start/text(),1,19)" />
            <xsl:variable name="instancefolderremoveT" select="translate($instancefolderfirst19,'T','_')" />
            <xsl:variable name="instancefolderreplacecolon" select="translate($instancefolderremoveT,':','-')" />
		
			<!-- Instance folder path -->
			<xsl:variable name="instancefolder" select="concat('42 Registro y reacción ante presiones_',$instancefolderreplacecolon)" />
			<!-- Foto de datos del evento -->
			<xsl:variable name="fotodedatos" select="ficha_42/datos_press/foto" />
			<!-- Firma de veedor -->
			<xsl:variable name="firmaveedor" select="ficha_42/comienza_registro_denuncia/ultimo_grupo/firma_veedor" />
			<!-- Firma de presidente -->
			<xsl:variable name="firmapresidente" select="ficha_42/comienza_registro_denuncia/ultimo_grupo/firma_presidente_comudidad" />
			<!-- Logo images -->
			<!-- Note: these don't work in the release apk for some reason
			<img src="file:///android_res/drawable/logo_ecociencia.png"/>
			<img src="file:///android_res/drawable/logo_wao.jpg" height="80" align="right"/>
			-->
			<img src="file:///android_asset/logo_ecociencia.png"/>
			<img src="file:///android_asset/logo_wao.jpg" height="80" align="right"/>
			
			<h1>42 - Registro y reacción ante presiones</h1> 
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
						<td><img src="file:///storage/emulated/0/odk/instances/{$instancefolder}/{$fotodedatos}" height="150" alt="NO FOTO"/></td>
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
						<td><img src="file:///storage/emulated/0/odk/instances/{$instancefolder}/{$firmaveedor}" height="75" alt="NO FIRMA"/></td> 
					</tr>
					<tr>
						<td height="100">Firma veedor en papel</td> 
						<td></td> 
					</tr>
					<tr>
						<td>Firma del presidente de la comunidad en celular</td> 
						<td><img src="file:///storage/emulated/0/odk/instances/{$instancefolder}/{$firmapresidente}" height="75" alt="NO FIRMA"/></td> 
					</tr>
					<tr>
						<td height="100">Firma del presidente de la comunidad en papel</td> 
						<td></td> 
					</tr>
				</table>
		</xsl:when>
		<!-- 'adam_42_Registro y reacción ante presiones' Form -->
		<xsl:when test="/*/@id = 'adam_ficha_19'">
		
		    <!-- Finding the path directory for the photos -->
            <xsl:variable name="instancefolderfirst19" select="substring(data/start/text(),1,19)" />
            <xsl:variable name="instancefolderremoveT" select="translate($instancefolderfirst19,'T','_')" />
            <xsl:variable name="instancefolderreplacecolon" select="translate($instancefolderremoveT,':','-')" />
		
			<!-- Instance folder path -->
			<xsl:variable name="instancefolder" select="concat('adam 42 Registro y reacción ante presiones_',$instancefolderreplacecolon)" />
			
			<!-- Foto de datos del evento -->
			<xsl:variable name="fotodedatos1" select="data/datos_press/foto1" />
			<xsl:variable name="fotodedatos2" select="data/datos_press/foto2" />
			<xsl:variable name="fotodedatos3" select="data/datos_press/foto3" />

			<!-- Firma de veedor -->
			<xsl:variable name="firmaveedor" select="data/comienza_registro_denuncia/ultimo_grupo/firma_veedor" />
			
			<!-- Firma de presidente -->
			<xsl:variable name="firmapresidente" select="data/comienza_registro_denuncia/ultimo_grupo/firma_presidente_comudidad" />
			
			<!-- Logo images -->
			<img src="file:///android_asset/logo_ecociencia.png"/>
			<img src="file:///android_asset/logo_wao.jpg" height="80" align="right"/>
			
			<!-- Form content -->
			<h1>42 - Registro y reacción ante presiones</h1> 
				<table id="formularios">
					<tr> 
						<td colspan="2">Datos del evento</td> 
					</tr>
					<tr> 
						<td>Tipo de presion o amenaza</td> 
						<td><xsl:value-of select="data/datos_press/press"/></td> 
					</tr> 
					<tr>
						<td>Nombre del veedor</td> 
						<td><xsl:value-of select="data/datos_press/veedor"/></td> 
					</tr>
					<tr>
						<td>Comunidad</td> 
						<td><xsl:value-of select="data/datos_press/comunidad"/></td> 
					</tr>
					<tr>
						<td>Fecha del evento</td> 
						<td><xsl:value-of select="data/datos_press/fecha"/></td> 
					</tr>
					<tr>
						<td>Hora del evento</td> 
						<td><xsl:value-of select="data/datos_press/hora"/></td> 
					</tr>
					<tr>
						<td>Tomar punto GPS</td> 
						<td><xsl:value-of select="data/datos_press/coordenadas"/></td> 
					</tr>
					<tr>
						<td>Descripción del Sitio</td> 
						<td><xsl:value-of select="data/datos_press/descripcion_sitio"/></td> 
					</tr>
					<tr>
						<td>Tomar fotos</td> 
						<td align="center"><img src="file:///storage/emulated/0/odk/instances/{$instancefolder}/{$fotodedatos1}" height="150" alt="NO EXISTE PRINCIPAL FOTO" style="white-space:pre-wrap; color:e5e5e5; font-size: 30px; font-family:Arial" hspace="10"/><img src="file:///storage/emulated/0/odk/instances/{$instancefolder}/{$fotodedatos2}" height="150" alt="NO EXISTE SEGUNDA FOTO" style="white-space:pre-wrap; color:e5e5e5; font-size: 30px; font-family:Arial" /><img src="file:///storage/emulated/0/odk/instances/{$instancefolder}/{$fotodedatos3}" height="150" alt="NO EXISTE TERCERA FOTO" style="white-space:pre-wrap; color:e5e5e5; font-size: 30px; font-family:Arial" hspace="10"/></td>
					</tr>
					<tr>
						<td>Nombre del causante</td> 
						<td><xsl:value-of select="data/datos_press/causante_nombre"/></td> 
					</tr>
					<tr>
						<td>Causante es:</td> 
						<td><xsl:value-of select="data/datos_press/causante_evento"/></td> 
					</tr>
					<tr>
						<td>Número de cédula del causante</td> 
						<td><xsl:value-of select="data/datos_press/cedula"/></td> 
					</tr>
				</table>
				
			<!-- Adding a page break to make printing nicer -->
			<div style="page-break-before: always;">
			</div>
				
				<!-- Just print what's necessary -->
				<xsl:choose>
					<xsl:when test="data/datos_press/press = 'Fauna'">
					
						<table id="formularios">
							<tr>
								<td colspan="2">Categoría de fauna</td> 
							</tr>
							<tr>
								<td><b>Nombre de la especie</b></td> 
								<td></td> 
							</tr>
							<tr>
								<td>------> Nombre Wao</td> 
								<td><xsl:value-of select="data/comienzo_categoria_fauna/fauna/nombre_especie_1/nombre_wao"/></td> 
							</tr>
							<tr>
								<td>------> Nombre Español</td> 
								<td><xsl:value-of select="data/comienzo_categoria_fauna/fauna/nombre_especie_1/nombre_espanol"/></td> 
							</tr>
							<tr>
								<td>------> Nombre Latín</td> 
								<td><xsl:value-of select="data/comienzo_categoria_fauna/fauna/nombre_especie_1/nombre_latin"/></td> 
							</tr>
							<tr>
								<td>Tipo de fauna / animales</td> 
								<td><xsl:value-of select="data/comienzo_categoria_fauna/fauna/tipo_fauna"/></td> 
							</tr>
							<tr>
								<td>Capturado</td> 
								<td><xsl:value-of select="data/comienzo_categoria_fauna/fauna/captura"/></td> 
							</tr>
							<tr>
								<td>¿Captura para...?</td> 
								<td><xsl:value-of select="data/comienzo_categoria_fauna/fauna/captura_fauna"/></td> 
							</tr>
							<xsl:choose>
								<xsl:when test="data/comienzo_categoria_fauna/fauna/captura_fauna = 'Otro'">
										<tr>
											<td>Especifique otro</td> 
											<td><xsl:value-of select="data/comienzo_categoria_fauna/fauna/otro_captura_fauna"/></td> 
										</tr>	
								</xsl:when>
							</xsl:choose>
							<tr>
								<td>Edad de la especie</td> 
								<td><xsl:value-of select="data/comienzo_categoria_fauna/fauna/edad_fauna"/></td> 
							</tr>
							<tr>
								<td>Sexo de la especie</td> 
								<td><xsl:value-of select="data/comienzo_categoria_fauna/fauna/sexo_fauna"/></td> 
							</tr>
						</table>
					</xsl:when>
					
					<xsl:when test="data/datos_press/press = 'Flora'">
						<table id="formularios">
							<tr>
								<td colspan="2">Categoría flora / plantas</td> 
							</tr>
							<tr>
								<td><b>Nombre de la especie</b></td> 
								<td></td> 
							</tr>
							<tr>
								<td>----> Nombre Wao</td> 
								<td><xsl:value-of select="data/comienzo_categoria_flora/flora/nombre_especie_2/nombre_wao"/></td> 
							</tr>
							<tr>
								<td>----> Nombre Español</td> 
								<td><xsl:value-of select="data/comienzo_categoria_flora/flora/nombre_especie_2/nombre_espanol"/></td> 
							</tr>
							<tr>
								<td>----> Nombre Latin</td> 
								<td><xsl:value-of select="data/comienzo_categoria_flora/flora/nombre_especie_2/nombre_latin"/></td> 
							</tr>
							<tr>
								<td>Parte de la flora usada</td> 
								<td><xsl:value-of select="data/comienzo_categoria_flora/flora/parte_usada"/></td> 
							</tr>
							<xsl:choose>
								<xsl:when test="data/comienzo_categoria_flora/flora/parte_usada = 'Otro'">
										<tr>
											<td>Especifique otro</td> 
											<td><xsl:value-of select="data/comienzo_categoria_flora/flora/otro_flora_usada"/></td> 
										</tr>	
								</xsl:when>
							</xsl:choose>
							<tr>
								<td>Uso / ¿Colectado para...?</td> 
								<td><xsl:value-of select="data/comienzo_categoria_flora/flora/captura_flora"/></td> 
							</tr>
							<xsl:choose>
								<xsl:when test="data/comienzo_categoria_flora/flora/captura_flora = 'Otro'">
										<tr>
											<td>Especifique otro</td> 
											<td><xsl:value-of select="data/comienzo_categoria_flora/flora/otro_captura_flora"/></td> 
										</tr>	
								</xsl:when>
							</xsl:choose>
							<tr>
								<td>Cantidad</td> 
								<td><xsl:value-of select="data/comienzo_categoria_flora/flora/cantidad"/></td> 
							</tr>
							<tr>
								<td>Peso (libras)</td> 
								<td><xsl:value-of select="data/comienzo_categoria_flora/flora/peso"/></td> 
							</tr>
						</table>
					</xsl:when>
					
					<xsl:when test="data/datos_press/press = 'Tala ilegal'">	
						<table id="formularios">
							<tr>
								<td colspan="2">Categoría tala ilegal</td> 
							</tr>
							<tr>
								<td><b>Nombre de la especie</b></td> 
								<td></td> 
							</tr>
							<tr>
								<td>----> Nombre Wao</td> 
								<td><xsl:value-of select="data/comienza_categoria_tala/tala/nombre_especie_3/nombre_wao"/></td> 
							</tr>
							<tr>
								<td>----> Nombre Español</td> 
								<td><xsl:value-of select="data/comienza_categoria_tala/tala/nombre_especie_3/nombre_espanol"/></td> 
							</tr>
							<tr>
								<td>----> Nombre Latin</td> 
								<td><xsl:value-of select="data/comienza_categoria_tala/tala/nombre_especie_3/nombre_latin"/></td> 
							</tr>
							<tr>
								<td>¿Cortado para...?</td> 
								<td><xsl:value-of select="data/comienza_categoria_tala/tala/uso_tala"/></td> 
							</tr>
							<xsl:choose>
								<xsl:when test="data/comienza_categoria_tala/tala/uso_tala = 'Otro'">
										<tr>
											<td>Especifique otro</td> 
											<td><xsl:value-of select="data/comienza_categoria_tala/tala/otro_uso_tala"/></td> 
										</tr>	
								</xsl:when>
							</xsl:choose>
							<tr>
								<td>Alto del árbol (metros)</td> 
								<td><xsl:value-of select="data/comienza_categoria_tala/tala/medidas/alto"/></td> 
							</tr>
							<tr>
								<td>Grueso del árbol / DAP</td> 
								<td><xsl:value-of select="data/comienza_categoria_tala/tala/medidas/arbol_grueso"/></td> 
							</tr>
							<tr>
								<td>Área clareada por la caída</td> 
								<td><xsl:value-of select="data/comienza_categoria_tala/tala/medidas/area_clareada"/></td> 
							</tr>
						</table>
					</xsl:when>
					
					<xsl:when test="data/datos_press/press = 'Deforestación'">
						<table id="formularios">
							<tr>
								<td colspan="2">Deforestación</td> 
							</tr>
							<tr>
								<td>Calcular el área de deforestación</td> 
								<td><xsl:value-of select="data/comienza_categoria_deforestacion/cat_deforestacion/shape"/></td> 
							</tr>
							<tr>
								<td>El área de deforestación (ha)</td> 
								<td><xsl:value-of select="data/comienza_categoria_deforestacion/cat_deforestacion/rounded_shape_area"/></td> 
							</tr>
							<tr>
								<td>¿Deforestado para...?</td> 
								<td><xsl:value-of select="data/comienza_categoria_deforestacion/cat_deforestacion/uso_def"/></td> 
							</tr>
							<xsl:choose>
								<xsl:when test="data/comienza_categoria_deforestacion/cat_deforestacion/uso_def = 'Otro'">
										<tr>
											<td>Especifique otro</td> 
											<td><xsl:value-of select="data/comienza_categoria_deforestacion/cat_deforestacion/otro_uso_def"/></td> 
										</tr>	
								</xsl:when>
							</xsl:choose>
							<tr>
								<td>Se uso-aserró los árboles</td> 
								<td><xsl:value-of select="data/comienza_categoria_deforestacion/cat_deforestacion/uso_aserro"/></td> 
							</tr>
							<xsl:choose>
								<xsl:when test="data/comienza_categoria_deforestacion/cat_deforestacion/uso_aserro = 'Sí'">
										<tr>
											<td>Para qué?</td> 
											<td><xsl:value-of select="data/comienza_categoria_deforestacion/cat_deforestacion/uso_aserro_si"/></td> 
										</tr>	
								</xsl:when>
							</xsl:choose>
							<tr>
								<td>Habitat de la deforestación</td> 
								<td><xsl:value-of select="data/comienza_categoria_deforestacion/cat_deforestacion/comienza_habitat/habitat_def"/></td> 
							</tr>		
						</table> 
					</xsl:when>
					
					<xsl:when test="data/datos_press/press = 'Contaminación'">
						<xsl:choose>
							<xsl:when test="data/comienza_categoria_contaminacion/categoria_contaminacion/tipo_de_cont = 'Envenenamiento'">
								<table id="formularios">
									<tr>
										<td colspan="2">Contaminación</td> 
									</tr>
									<tr>
										<td><b>Envenenamiento</b></td> 
										<td></td>
									</tr>
									<tr>
										<td>Quien es el responsable del envenenamiento</td> 
										<td><xsl:value-of select="data/comienza_categoria_contaminacion/categoria_contaminacion/comienza_contaminacion_envenenamiento/causante"/></td> 
									</tr>
									<tr>
										<td>Que fue lo que envenenó</td> 
										<td><xsl:value-of select="data/comienza_categoria_contaminacion/categoria_contaminacion/comienza_contaminacion_envenenamiento/envenenamiento"/></td> 
									</tr>
									<tr>
										<td>Con que motivo envenenó</td> 
										<td><xsl:value-of select="data/comienza_categoria_contaminacion/categoria_contaminacion/comienza_contaminacion_envenenamiento/envenena_motivo"/></td> 
									</tr>
									<xsl:choose>
										<xsl:when test="data/comienza_categoria_contaminacion/categoria_contaminacion/comienza_contaminacion_envenenamiento/envenena_motivo = 'Otro'">
											<tr>
												<td>Especifique otro</td> 
												<td><xsl:value-of select="data/comienza_categoria_contaminacion/categoria_contaminacion/comienza_contaminacion_envenenamiento/otro_envenena_motivo"/></td> 
											</tr>	
										</xsl:when>
									</xsl:choose>
								</table>
							</xsl:when>
							
							<xsl:when test="data/comienza_categoria_contaminacion/categoria_contaminacion/tipo_de_cont = 'Derrame de aceite/motor canoa'">
								<table id="formularios">
									<tr>
										<td colspan="2">Contaminación</td> 
									</tr>							
									<tr>
										<td><b>Derrame de aceite / motor canoa</b></td> 
										<td></td>
									</tr>
									<tr>
										<td>Contaminación en</td> 
										<td><xsl:value-of select="data/comienza_categoria_contaminacion/categoria_contaminacion/comienza_contaminacion_aceite/tipo_derrame"/></td> 
									</tr>
									<xsl:choose>
										<xsl:when test="data/comienza_categoria_contaminacion/categoria_contaminacion/comienza_contaminacion_aceite/tipo_derrame = 'Otro'">
											<tr>
												<td>Especifique otro</td> 
												<td><xsl:value-of select="data/comienza_categoria_contaminacion/categoria_contaminacion/comienza_contaminacion_aceite/otro_tipo_derrame"/></td> 
											</tr>	
										</xsl:when>
									</xsl:choose>
									<tr>
										<td>Lugar donde ocurrió</td> 
										<td><xsl:value-of select="data/comienza_categoria_contaminacion/categoria_contaminacion/comienza_contaminacion_aceite/lugar"/></td> 
									</tr>
									<tr>
										<td>Cantidad de derrame de aceite</td> 
										<td><xsl:value-of select="data/comienza_categoria_contaminacion/categoria_contaminacion/comienza_contaminacion_aceite/cantidad_aceite"/></td> 
									</tr>
								</table>
							</xsl:when>
							
							<xsl:when test="data/comienza_categoria_contaminacion/categoria_contaminacion/tipo_de_cont = 'Derrame por petrolera'">
								<table id="formularios">
									<tr>
										<td colspan="2">Contaminación</td> 
									</tr>						
									<tr>
										<td><b>Derrame por petrolera</b></td> 
										<td></td>
									</tr>
									<tr>
										<td>Que componente se vió afectado</td> 
										<td><xsl:value-of select="data/comienza_categoria_contaminacion/categoria_contaminacion/comienza_contaminacion_petroleo/derrame_afec"/></td> 
									</tr>
									<tr>
										<td>Que se derramó</td> 
										<td><xsl:value-of select="data/comienza_categoria_contaminacion/categoria_contaminacion/comienza_contaminacion_petroleo/derrame"/></td> 
									</tr>
									<tr>
										<td>Cual petrolera fue la causante</td> 
										<td><xsl:value-of select="data/comienza_categoria_contaminacion/categoria_contaminacion/comienza_contaminacion_petroleo/petrolera"/></td> 
									</tr>
								</table> 
							</xsl:when>
						</xsl:choose>		
					</xsl:when>
					
					<xsl:when test="data/datos_press/press = 'Invasión'">
						<table id="formularios">
							<tr>
								<td colspan="2">Invasión de tierras Waorani</td> 
							</tr>
							<tr>
								<td>Quién/Quienes invadieron</td> 
								<td><xsl:value-of select="data/comienza_categoria_invasion/invasion/invasores"/></td> 
							</tr>
							<tr>
								<td>Qué se hizo/construyó en el lugar invasión</td> 
								<td><xsl:value-of select="data/comienza_categoria_invasion/invasion/invasion_motivo"/></td> 
							</tr>
							<tr>
								<td>Calcular el área de invasión</td> 
								<td><xsl:value-of select="data/comienza_categoria_invasion/invasion/shape1"/></td> 
							</tr>
							<tr>
								<td>El area de invasión (ha)</td> 
								<td><xsl:value-of select="data/comienza_categoria_invasion/invasion/shape1_area"/></td> 
							</tr>
							<tr>
								<td>Habitat de la invasión</td> 
								<td><xsl:value-of select="data/comienza_categoria_invasion/invasion/habitat_def"/></td> 
							</tr>
						</table> 
					</xsl:when>
					
					<xsl:otherwise>
						<h1 align="center">Esta categoría de presion es nuevo - se necesita actualizar el XSLT para imprimir</h1>
					</xsl:otherwise>
				</xsl:choose>
				
				<table id="formularios">
					<tr>
						<td colspan="2">Registre la denuncia</td> 
					</tr>
					<tr>
						<td>Acción recomendada</td> 
						<td><xsl:value-of select="data/comienza_registro_denuncia/ultimo_grupo/accion_recomendada"/></td> 
					</tr>
					<tr>
						<td>Firma veedor en celular</td> 
						<td><img src="file:///storage/emulated/0/odk/instances/{$instancefolder}/{$firmaveedor}" height="75" alt="NO FIRMA"/></td> 
					</tr>
					<tr>
						<td height="100">Firma veedor en papel</td> 
						<td></td> 
					</tr>
					<tr>
						<td>Firma del presidente de la comunidad en celular</td> 
						<td><img src="file:///storage/emulated/0/odk/instances/{$instancefolder}/{$firmapresidente}" height="75" alt="NO FIRMA"/></td> 
					</tr>
					<tr>
						<td height="100">Firma del presidente de la comunidad en papel</td> 
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