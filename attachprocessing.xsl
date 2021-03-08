<xsl:stylesheet version="1.0" extension-element-prefixes="dp" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:dp="http://www.datapower.com/extensions">
<xsl:output omit-xml-declaration="yes" indent="yes"/>
<xsl:template match="/">
<xsl:variable name="manifest" select="dp:variable('var://context/INPUT/attachment-manifest')"/>
<xsl:variable name="ExtractedMTOM" select="$manifest/manifest/attachments/attachment/uri"/>
<dp:set-variable name="'var://context/var/ExtractedMTOM'" value="$ExtractedMTOM"/>
<xsl:variable name="cid" select="concat($ExtractedMTOM,'?Encode=base64')"/>
<xsl:variable name="base64">
<dp:url-open target="{$cid}"/>
</xsl:variable>
<!-- <xsl:variable name="input" select="$ExtractedMTOM"/>
<dp:url-open target="{$input}"/> -->
<!-- <xsl:variable name="SerializedData">
<dp:serialize select="$input"/>
</xsl:variable>
<xsl:variable name="DecodedMTOM">
<xsl:value-of select="dp:encode($SerializedData,'base-64')" disable-output-escaping="yes"/>
</xsl:variable>
<dp:set-variable name="'var://context/var/DecodedMTOM'" value="$DecodedMTOM"/>
<xsl:variable name="DecodedMTOM" value="dp:variable('var://context/var/DecodedMTOM')"/> -->
<xsl:variable name="content-type" select="$manifest/manifest/attachments/attachment/header[name='Content-Type']/value"/>
<dp:set-variable name="'var://context/var/content-type'" value="$content-type"/>
<xsl:variable name="file_content_type" select="substring-before($content-type,';')"/>
<xsl:variable name="filename" select="substring-after($content-type,'=')"/>
<dp:set-variable name="'var://context/var/file_content_type'" value="$file_content_type"/>
<dp:set-variable name="'var://context/var/filename'" value="$filename"/>
<xsl:variable name="TargetURL" select="concat('ftp://172.17.13.135:21/Ashok','/',$filename)"/>
<!--<dp:set-variable name="'var://service/routing-url'" value="$TargetURL"/> --> 
<dp:url-open target="{$TargetURL}" content-type="$file_content_type" response="ignore" Append="true" data-type="base64">
    <xsl:value-of select="$base64"/>
   </dp:url-open>
</xsl:template>
</xsl:stylesheet>