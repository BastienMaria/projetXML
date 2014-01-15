<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:svg="http://www.w3.org/2000/svg"
                xmlns:my="http://www.fgeorges.org/TMP/svg/charts#internals"
                version="2.0">

   <xsl:output indent="yes"/>

   <!--
       +- - - - - - - - - - - - - - - - - - - - - - - -+
       |  +- - - - - - - - - - - - - - - - - - - -+ nn |
       |  |                                       |    |
       |  |                                   o   |    |
       |  | . . . . . . . . . . .o. . . . . oo. . | nn |
       |  |                    oo oo      oo      |    |
       |  |         o        oo     o   oo        |    |
       |  | . . . oo oo . ooo . . . .ooo. . . . . | nn |
       |  |    ooo     ooo                        |    |
       |  |   o                                   |    |
       |  +- -|- -|- -|- -|- -|- -|- -|- -|- -|- -+ nn |
       |      x   x   x   x   x   x   x   x   x        |
       +- - - - - - - - - - - - - - - - - - - - - - - -+

       The outer box is the whole space that the diagram will occupy.
       The length between that imaginary box and the top-left corner
       of the diagram is represented by '$init-x' and '$init-y'.

       The length of the rectangle of the diagram itself (the inner
       box in the picture) is represented by '$width' and '$height'.

       The number of steps on the right-hand Y axis (in the picture
       there are 3 steps, that is 3 steps "between" the various "nn"s)
       is represented by @step-number in the input document.  The
       numeric value between two steps is @step-value.

       The diagram's plot (the "o"s) and the X axis (the "x"s) are
       represented by the input document.  Exemple of input:

           <input min-value="100" step-value="5" step-number="5">
              <val v="110">Jan-08</val>
              <val v="107">Feb-08</val>
              <val v="123">Mar-08</val>
           </input>

        In this example, the Y axis will be from 100 to 125, with a
        line (and a label) from 5 to 5.  The X axis will have 3 labels
        (from Jan to Mar) and the plot will be computed from 3 values:
        110, 107 and finally 123.
    -->
    <xsl:param name="init-x" as="xs:double" select="10"/>
    <xsl:param name="init-y" as="xs:double" select="10"/>
    <xsl:param name="width"  as="xs:double" select="500"/>
    <xsl:param name="height" as="xs:double" select="250"/>

    <xsl:variable name="baseline"  select="$height + $init-y"/>

    <!--
        For test purpose: an root SVG element that should be ok for the
        default values of the global parameters, provided an input of
        10 or 20 values.
    -->
    <xsl:template match="/">
        <svg:svg width="540" height="300">
            <svg:g>
                <xsl:apply-templates select="*"/>
            </svg:g>
        </svg:svg>
    </xsl:template>

    <!--
        The Y axis, the X axis and the plot line.
    -->
    <xsl:template match="input">
        <!-- the diagram's box -->
        <svg:rect x="{ $init-x }" y="{ $init-y }"
                  width="{ $width }" height="{ $height }"
                  fill="#fff" stroke="#000"/>
        <!-- the Y axis's labels and their lines -->
        <xsl:sequence select="my:lines(@min-value, @step-value, @step-number)"/>
        <xsl:variable name="len" select="$width div count(*)"/>
        <!-- the X axis's labels -->
        <xsl:apply-templates select="*">
            <xsl:with-param name="len" select="$len"/>
        </xsl:apply-templates>
        <!-- the plot line -->
        <svg:path stroke="blue" stroke-width="1" fill="none">
            <xsl:attribute name="d">
                <xsl:apply-templates select="*" mode="path">
                    <xsl:with-param name="len"       select="$len"/>
                    <xsl:with-param name="min"       select="@min-value"/>
                    <xsl:with-param name="one-y-len" select="
                   ( $height div @step-number ) div @step-value"/>
                </xsl:apply-templates>
            </xsl:attribute>
        </svg:path>
    </xsl:template>

    <!--
        Draw a label on the X axis.
    -->
    <xsl:template match="val">
        <xsl:param name="len" as="xs:double"/>
        <xsl:variable name="x" select="my:x-pos($len, position())"/>
        <svg:path d="M { $x },{ $baseline } L { $x },{ $baseline + 5 }" stroke="#000"/>
        <svg:text x="{ $x + 10 }" y="{ $baseline + 15 }"
                  transform="rotate(-45 { $x + 10 } { $baseline + 15 })"
                  font-size="10px" text-anchor="end">
            <xsl:value-of select="."/>
        </svg:text>
    </xsl:template>

    <!--
        Compute one single step of an SVG path's @d, to draw the plot.
    -->
    <xsl:template match="val" mode="path">
        <xsl:param name="len"       as="xs:double"/>
        <xsl:param name="min"       as="xs:double"/>
        <xsl:param name="one-y-len" as="xs:double"/>
        <xsl:value-of select="if ( position() eq 1 ) then 'M' else 'L'"/>
        <xsl:text> </xsl:text>
        <xsl:value-of select="my:x-pos($len, position())"/>
        <xsl:text>,</xsl:text>
        <xsl:value-of select="my:y-pos($one-y-len, @v, $min)"/>
        <xsl:text> </xsl:text>
    </xsl:template>

    <!--
        The lines for each Y step, as well as the label for each Y
        step.
    -->
    <xsl:function name="my:lines" as="element()+">
        <xsl:param name="min"      as="xs:double"/>
        <xsl:param name="step-val" as="xs:double"/>
        <xsl:param name="step-num" as="xs:integer"/>
        <xsl:variable name="step-len" select="$height div $step-num"/>
        <!-- the N - 1 lines -->
        <xsl:for-each select="1 to ($step-num - 1)">
            <xsl:variable name="y" select="(. * $step-len) + $init-y"/>
            <svg:path d="M { $init-x },{ $y } L { $width + $init-x },{ $y }" stroke="#AAA"/>
        </xsl:for-each>
        <!-- the N + 1 labels -->
        <xsl:for-each select="0 to $step-num">
            <xsl:variable name="y" select="(. * $step-len) + $init-y"/>
            <svg:text x="{ $width + $init-x + 25 }" y="{ $y + 4 }" font-size="10px"
                      text-align="end" text-anchor="end" font-family="Helvetica Condensed">
                <xsl:value-of select="$min + ($step-num - .) * $step-val"/>
            </svg:text>
        </xsl:for-each>
    </xsl:function>

    <!--
        Compute the absolute X position from the ordinal position and
        the length of one X step.
    -->
    <xsl:function name="my:x-pos" as="xs:double">
        <xsl:param name="step-len" as="xs:double"/>
        <xsl:param name="position" as="xs:integer"/>
        <xsl:sequence select="($step-len * $position) - ($step-len div 2) + $init-x"/>
    </xsl:function>

    <!--
        Compute the absolute Y position for one point of the diagram's
        plot.  $one-len is the length of 1 on the Y axis, $value is the
        Y value of the plot's point, and $min is the minimal value on
        the Y axis.
    -->
    <xsl:function name="my:y-pos" as="xs:double">
        <xsl:param name="one-len" as="xs:double"/>
        <xsl:param name="value"   as="xs:double"/>
        <xsl:param name="min"     as="xs:double"/>
        <xsl:variable name="mid" select="$height div 2"/>
        <!-- scale the value to the scale [min - max] -->
        <xsl:variable name="val" select="($value - $min) * $one-len"/>
        <!-- reverse 0->$height and $height->0, 'cause in SVG y=0 is at top -->
        <xsl:variable name="rev" select="(- ($val - $mid)) + $mid"/>
        <!-- slide because our graph begins at y=$init-y -->
        <xsl:value-of select="$rev + $init-y"/>
    </xsl:function>

</xsl:stylesheet>