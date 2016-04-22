Feature: bugreports
  As a CSL cite processor hacker
  I want the test bugreports_ProcessorHang1 to pass

  @citation @bugreports @citations
  Scenario: Processor Hang1
    Given the following style:
    """
    <?xml version="1.0" encoding="utf-8"?>
    <style xmlns="http://purl.org/net/xbiblio/csl" class="in-text" version="1.0" demote-non-dropping-particle="sort-only" default-locale="en-US" page-range-format="expanded">
      <info>
        <title>Northeastern Naturalist</title>
        <id>http://www.zotero.org/styles/northeastern-naturalist</id>
        <link href="http://www.zotero.org/styles/northeastern-naturalist" rel="self"/>
        <link href="http://www.zotero.org/styles/the-journal-of-wildlife-management" rel="template"/>
        <link href="http://www.eaglehill.us/programs/journals/nena/NENAauthor.pdf" rel="documentation"/>
        <author>
          <name>Sebastian Karcher</name>
        </author>
        <category citation-format="author-date"/>
        <category field="biology"/>
        <issn>1092-6194</issn>
        <eissn>1938-5307</eissn>
        <updated>2012-09-27T22:06:38+00:00</updated>
        <rights license="http://creativecommons.org/licenses/by-sa/3.0/">This work is licensed under a Creative Commons Attribution-ShareAlike 3.0 License</rights>
      </info>
      <macro name="author">
        <names variable="author" suffix=".">
          <name sort-separator=", " initialize-with="." and="text" name-as-sort-order="first" delimiter=", " delimiter-precedes-last="always"/>
          <label form="short" prefix=" (" suffix=")" text-case="capitalize-first"/>
          <substitute>
            <names variable="editor"/>
            <text variable="title"/>
          </substitute>
        </names>
      </macro>
      <macro name="editor">
        <names variable="editor">
          <name sort-separator=" " initialize-with="." and="text" delimiter=", "/>
          <label form="short" prefix=" (" suffix=")" text-case="capitalize-first"/>
        </names>
      </macro>
      <macro name="author-short">
        <names variable="author">
          <name form="short" and="text" delimiter=", " initialize-with="."/>
          <substitute>
            <names variable="editor"/>
            <text variable="title"/>
          </substitute>
        </names>
      </macro>
      <macro name="year-date">
        <choose>
          <if variable="issued">
            <date variable="issued">
              <date-part name="year"/>
            </date>
            <text variable="year-suffix" font-style="italic"/>
          </if>
          <else>
            <text term="no date" form="short"/>
          </else>
        </choose>
      </macro>
      <macro name="chapter-info">
        <group delimiter=" ">
          <choose>
            <if type="chapter paper-conference" match="any">
              <group delimiter=" ">
                <label variable="page" text-case="capitalize-first" form="short"/>
                <text variable="page" suffix=","/>
                <text term="in" font-style="italic" text-case="capitalize-first"/>
              </group>
            </if>
          </choose>
          <text macro="editor"/>
        </group>
      </macro>
      <macro name="container">
        <choose>
          <if type="article-journal article-magazine" match="any">
            <group delimiter=" ">
              <text variable="container-title"/>
              <group delimiter=":">
                <text variable="volume"/>
                <text variable="page"/>
              </group>
            </group>
          </if>
          <else-if type="article-newspaper">
            <text variable="container-title"/>
            <date variable="issued" delimiter=" ">
              <date-part name="day"/>
              <date-part name="month"/>
              <date-part name="year"/>
            </date>
            <text variable="section" prefix="; section "/>
            <text variable="page" prefix=":"/>
          </else-if>
          <else>
            <text variable="container-title"/>
          </else>
        </choose>
      </macro>
      <macro name="publisher">
        <group delimiter=", ">
          <group delimiter=" ">
            <text variable="collection-title"/>
            <text variable="collection-number"/>
          </group>
          <text variable="publisher"/>
          <text variable="publisher-place"/>
        </group>
      </macro>
      <macro name="edition">
        <choose>
          <if is-numeric="edition">
            <group delimiter=" ">
              <number variable="edition" form="long-ordinal" text-case="capitalize-first"/>
              <text term="edition"/>
            </group>
          </if>
          <else>
            <text variable="edition"/>
          </else>
        </choose>
      </macro>
      <macro name="volume">
        <choose>
          <if type="article-journal article-magazine" match="none">
            <choose>
              <if variable="volume">
                <group delimiter=" ">
                  <text term="volume" text-case="capitalize-first" form="short"/>
                  <text variable="volume"/>
                </group>
              </if>
            </choose>
          </if>
        </choose>
      </macro>
      <macro name="accessed">
        <choose>
          <if variable="URL">
            <group delimiter=". ">
              <text variable="URL" prefix="Available online at "/>
              <group delimiter=" ">
                <text term="accessed" text-case="capitalize-first"/>
                <date variable="accessed" delimiter=" ">
                  <date-part name="month" text-case="capitalize-first"/>
                  <date-part name="day" suffix=","/>
                  <date-part name="year"/>
                </date>
              </group>
            </group>
          </if>
        </choose>
      </macro>
      <citation et-al-min="3" et-al-use-first="1" disambiguate-add-year-suffix="true" disambiguate-add-names="true" disambiguate-add-givenname="true" givenname-disambiguation-rule="by-cite" collapse="year-suffix">
        <sort>
          <key macro="author-short"/>
          <key macro="year-date"/>
        </sort>
        <layout prefix="(" suffix=")" delimiter=", ">
          <group delimiter=":">
            <group delimiter=" ">
              <text macro="author-short"/>
              <text macro="year-date"/>
            </group>
            <text variable="locator"/>
          </group>
        </layout>
      </citation>
      <bibliography entry-spacing="0" hanging-indent="true">
        <sort>
          <key macro="author"/>
          <key macro="year-date"/>
        </sort>
        <layout suffix=".">
          <group delimiter=". ">
            <text macro="author"/>
            <text macro="year-date"/>
            <text variable="title"/>
            <text macro="chapter-info"/>
            <text macro="container"/>
            <text macro="edition"/>
            <text macro="volume"/>
            <text variable="genre"/>
            <text macro="publisher"/>
            <text variable="number-of-pages" suffix=" pp."/>
            <text macro="accessed"/>
          </group>
        </layout>
      </bibliography>
    </style>

    """
    And the following input:
    """
    [{"DOI":"10.1111/j.1523-1739.2008.01029.x","URL":"http://dx.doi.org/10.1111/j.1523-1739.2008.01029.x","abstract":"Studies have documented biodiversity losses due to intensification of coffee management (reduction in canopy richness and complexity). Nevertheless, questions remain regarding relative sensitivity of different taxa, habitat specialists, and functional groups, and whether implications for biodiversity conservation vary across regions. We quantitatively reviewed data from ant, bird, and tree biodiversity studies in coffee agroecosystems to address the following questions: Does species richness decline with intensification or with individual vegetation characteristics? Are there significant losses of species richness in coffee-management systems compared with forests? Is species loss greater for forest species or for particular functional groups? and Are ants or birds more strongly affected by intensification? Across studies, ant and bird richness declined with management intensification and with changes in vegetation. Species richness of all ants and birds and of forest ant and bird species was lower in most coffee agroecosystems than in forests, but rustic coffee (grown under native forest canopies) had equal or greater ant and bird richness than nearby forests. Sun coffee (grown without canopy trees) sustained the highest species losses, and species loss of forest ant, bird, and tree species increased with management intensity. Losses of ant and bird species were similar, although losses of forest ants were more drastic in rustic coffee. Richness of migratory birds and of birds that forage across vegetation strata was less affected by intensification than richness of resident, canopy, and understory bird species. Rustic farms protected more species than other coffee systems, and loss of species depended greatly on habitat specialization and functional traits. We recommend that forest be protected, rustic coffee be promoted, and intensive coffee farms be restored by augmenting native tree density and richness and allowing growth of epiphytes. We also recommend that future research focus on potential trade-offs between biodiversity conservation and farmer livelihoods stemming from coffee production. Diversos estudios han documentado las p�rdidas de biodiversidad debido a la intensificaci�n del manejo de caf� (disminuci�n de la riqueza y complejidad del dosel). Sin embargo, persisten preguntas sobre la sensibilidad relativa de diferentes taxa, especialistas de h�bitat y grupos funcionales, y s� las implicaciones para la conservaci�n de la biodiversidad var�an entre regiones. Revisamos cuantitativamente los datos de estudios de biodiversidad de hormigas, aves y �rboles en agroecosistemas de caf� para abordar las siguientes preguntas: �La riqueza de especies declina con la intensificaci�n o con las caracter�sticas individuales de la vegetaci�n?�Hay p�rdidas significativas de riqueza de especies en los sistemas cafetaleros en comparaci�n con los bosques?�Es mayor la p�rdida en especies de bosque o en grupos funcionales particulares? y �Las aves o las hormigas son m�s afectadas por la intensificaci�n? En los estudios revisados, la riqueza de hormigas y aves declin� con la intensificaci�n del manejo y con los cambios de vegetaci�n. La riqueza de especies de todas las hormigas y aves y la de especies de hormigas y aves de bosque fue menor en la mayor�a de los agroecosistemas cafetaleros que en los bosques, pero el caf� r�stico (cultivado bajo dosel de bosque nativo) sustent� la mayor p�rdida de especies, y la p�rdida de especies de hormigas, aves y �rboles de bosque aument� con la intensificaci�n del manejo. Las p�rdidas de especies de hormigas y aves fueron similares, aunque las p�rdidas de hormigas de bosque fueron m�s dr�sticas en el caf� r�stico. La riqueza de especies de aves migratorias y de aves que forrajean en varios estratos de vegetaci�n fueron menos afectadas por la intensificaci�n que las especies residentes de dosel y de sotobosque. Las fincas r�sticas protegieron m�s especies que otros sistemas cafetaleros, y la p�rdida de especies dependi� mayormente de la especializaci�n de h�bitat y de los atributos funcionales. Recomendamos que el bosque sea protegido, se promueva el caf� r�stico y se restauren las fincas intensivas mediante el incremento de la densidad y riqueza de �rboles nativos y permitiendo el crecimiento de ep�fitas. Tambi�n recomendamos que las futuras investigaciones enfoquen las compensaciones potenciales entre la conservaci�n de la biodiversidad y la forma de vida de los campesinos que producen caf�.","accessed":{"date-parts":[["2008",9,25]]},"author":[{"family":"Philpott","given":"S. M."},{"family":"Arendt","given":"W. J."},{"family":"Armbrecht","given":"I."},{"family":"Bichier","given":"P."},{"family":"Dietsch","given":"T. V."},{"family":"Gordon","given":"C."},{"family":"Greenberg","given":"R."},{"family":"Perfecto","given":"I."},{"family":"Reynoso-Santos","given":"R."},{"family":"Soto-Pinto","given":"L."},{"family":"Tejeda-Cruz","given":"C."},{"family":"Williams-Linera","given":"G."},{"family":"Valenzuela","given":"J."},{"family":"Zolotoff","given":"J. M."}],"container-title":"Conservation Biology","id":"ITEM-1","issued":{"date-parts":[["2008"]]},"key":"WQDG7EP5","page":"1093-1105","shortTitle":"Biodiversity Loss in Latin American Coffee Landscapes","source":"Wiley InterScience","title":"Biodiversity loss in Latin American coffee landscapes: review of the evidence on ants, birds, and trees","type":"article-journal","volume":"22"},{"DOI":"10.1603/0046-225X(2008)37[181:BDOPAA]2.0.CO;2","ISSN":"0046-225X","URL":"http://www.bioone.org/doi/abs/10.1603/0046-225X(2008)37%5B181:BDOPAA%5D2.0.CO%3B2","abstract":"Aspects of predator assemblages that alter predator effects on prey have received extensive recent attention. Among other mechanisms, differences in behavior or resource use within predator trophic levels may enhance predator effects on prey, especially if effects of each predator species differ with environmental conditions. We address whether three common ant species (Azteca instabilis F. Smith, Camponotus textor Forel, and Crematogaster spp.) are functionally unique in coffee agroecosystems, asking if each species differs in (1) cooperative foraging behavior, (2) responses to experimentally introduced herbivores, and (3) responses to pest outbreaks. Furthermore, we examined the behaviors and effects of each ant species under different conditions by varying herbivore species, herbivore size, and herbivore density and carrying out observations in different seasons. Ant species significantly differed in foraging behaviors, in effects on individual herbivores, and in responses to pest outbreaks in terms of both type and time of response to herbivores. The behaviors and effects of each ant species differed in the dry and wet seasons and for different herbivore species and sizes. Although A. instabilis generally removed more larvae and more quickly removed larvae, this was not the case under all conditions. The data presented thus support that common ant species in coffee agroecosystems are behaviorally diverse in their responses to herbivores under different conditions. We discuss the implications of these differences in ant behaviors for enhancement of predatory function in light of both multipredator effects and in terms of the potential importance of predator diversity.","author":[{"family":"Philpott","given":"S. M."},{"family":"Perfecto","given":"I."},{"family":"Vandermeer","given":"J."}],"container-title":"Environmental Entomology","id":"ITEM-2","issued":{"date-parts":[["2008"]]},"key":"74WGHVRQ","page":"181-191","source":"BioOne","title":"Behavioral diversity of predatory arboreal ants in coffee agroecosystems","type":"article-journal","volume":"37"},{"DOI":"10.1111/j.1365-2656.2008.01358.x","ISSN":"1365-2656","URL":"http://onlinelibrary.wiley.com/doi/10.1111/j.1365-2656.2008.01358.x/abstract","abstract":"Ants are important predators in agricultural systems, and have complex and often strong effects on lower trophic levels. Agricultural intensification reduces habitat complexity, food web diversity and structure, and affects predator communities. Theory predicts that strong top-down cascades are less likely to occur as habitat and food web complexity decrease. * 2To examine relationships between habitat complexity and predator effects, we excluded ants from coffee plants in coffee agroecosystems varying in vegetation complexity. Specifically, we studied the effects of eliminating ants on arthropod assemblages, herbivory, damage by the coffee berry borer and coffee yields in four sites differing in management intensification. We also sampled ant assemblages in each management type to see whether changes in ant assemblages relate to any observed changes in top-down effects. * 3Removing ants did not change total arthropod densities, herbivory, coffee berry borer damage or coffee yields. Ants did affect densities of some arthropod orders, but did not affect densities of different feeding groups. The effects of ants on lower trophic levels did not change with coffee management intensity. * 4Diversity and activity of ants on experimental plants did not change with coffee intensification, but the ant species composition differed. * 5Although variation in habitat complexity may affect trophic cascades, manipulating predatory ants across a range of coffee agroecosystems varying in management intensity did not result in differing effects on arthropod assemblages, herbivory, coffee berry borer attack or coffee yields. Thus, there is no clear pattern that top-down effects of ants in coffee agroecosystems intensify or dampen with decreased habitat complexity.","accessed":{"date-parts":[["2013",6,10]]},"author":[{"family":"Philpott","given":"S. M."},{"family":"Perfecto","given":"I."},{"family":"Vandermeer","given":"J."}],"container-title":"Journal of Animal Ecology","id":"ITEM-3","issue":"3","issued":{"date-parts":[["2008"]]},"key":"95I7USJP","language":"en","page":"505–511","source":"Wiley Online Library","title":"Effects of predatory ants on lower trophic levels across a gradient of coffee management complexity","type":"article-journal","volume":"77"}]
    """
    And I have a citations input
    When I cite all items
    Then the result should be:
    """
    ..[0] (Philpott, Arendt, et al. 2008)
    >>[1] (Philpott, Perfecto, et al. 2008<i>a</i>)
    >>[2] (Philpott, Perfecto, et al. 2008<i>b</i>)
    """
