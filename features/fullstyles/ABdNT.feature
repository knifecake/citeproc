Feature: fullstyles
  As a CSL cite processor hacker
  I want the test fullstyles_ABdNT to pass

  @bibliography @fullstyles
  Scenario: ABd NT
    Given the following style:
    """
    <?xml version="1.0" encoding="utf-8"?>
    <style xmlns="http://purl.org/net/xbiblio/csl" version="1.0" class="in-text" default-locale="pt-BR">
      <info>
        <title>Associação Brasileira de Normas Técnicas (ABNT)</title>
        <id>http://www.zotero.org/styles/associacao-brasileira-de-normas-tecnicas</id>
        <link href="http://www.zotero.org/styles/associacao-brasileira-de-normas-tecnicas" rel="self"/>
        <author>
          <name>Juliana Geyna Régis</name>
          <email>juliana.regis@ipea.gov.br</email>
        </author>
        <contributor>
          <name>Lucas Mation</name>
          <email>lucas.mation@ipea.gov.br</email>
        </contributor>
        <contributor>
          <name>Eduardo Michelotti Bettoni</name>
          <email>webtur@ufpr.br</email>
        </contributor>
        <contributor>
          <name>Paulo Augusto Nascimento</name>
          <email>paulo.nascimento@ipea.gov.br</email>
        </contributor>
        <contributor>
          <name>José Antonio Meira da Rocha</name>
          <email>joseantoniorocha@gmail.com</email>
          <uri>http://meiradarocha.jor.br</uri>
        </contributor>
        <contributor>
          <name>Mario José</name>
          <email>gnumario [at-mark] gmail [dot-mark] com</email>
        </contributor>
        <category citation-format="author-date"/>
        <category field="generic-base"/>
        <summary>The Brazilian standard style</summary>
        <updated>2012-12-11T02:56:15+00:00</updated>
        <rights license="http://creativecommons.org/licenses/by-sa/3.0/">This work is licensed under a Creative Commons Attribution-ShareAlike 3.0 License</rights>
      </info>
      <locale xml:lang="pt-BR">
        <terms>
          <!--Abreviacoes meses "Forma Curta"-->
          <term name="month-01" form="short">jan.</term>
          <term name="month-02" form="short">fev.</term>
          <term name="month-03" form="short">mar.</term>
          <term name="month-04" form="short">abr.</term>
          <term name="month-05" form="short">maio</term>
          <term name="month-06" form="short">jun.</term>
          <term name="month-07" form="short">jul.</term>
          <term name="month-08" form="short">ago.</term>
          <term name="month-09" form="short">set.</term>
          <term name="month-10" form="short">out.</term>
          <term name="month-11" form="short">nov.</term>
          <term name="month-12" form="short">dez.</term>
          <!--Os termos abaixo serao utilizados quando houverem nomes de editores. Apos a citacao dos nomes, eles irao aparecer entre parenteses.-->
          <term name="editor" form="short">
            <single>ed</single>
            <multiple>eds</multiple>
          </term>
          <term name="container-author" form="short">
            <single>ed</single>
            <multiple>eds</multiple>
          </term>
          <term name="collection-editor" form="short">
            <single>ed</single>
            <multiple>eds</multiple>
          </term>
        </terms>
      </locale>
      <!--A macro 'container-contribuitor' e responsavel por mostrar os nomes dos editores, serao apresentados SOBRENOME, INICIAIS PRENOMES 
    tendo as inicias separadas por ponto.-->
      <macro name="container-contributors">
        <choose>
          <if type="chapter">
            <names variable="container-author" delimiter=", ">
              <name name-as-sort-order="all" sort-separator=", " initialize-with=". " delimiter="; " delimiter-precedes-last="always">
                <name-part name="family" text-case="uppercase"/>
                <name-part name="given" text-case="uppercase"/>
              </name>
              <et-al prefix=" " font-style="italic"/>
              <label form="short" prefix=" (" suffix=".). " text-case="capitalize-first"/>
              <substitute>
                <names variable="editor"/>
                <names variable="collection-editor"/>
              </substitute>
            </names>
          </if>
        </choose>
      </macro>
      <!--A macro 'secundary-contribuitor' e responsavel por mostrar os nomes dos organizadores, serao apresentados SOBRENOME, INICIAIS PRENOMES
    tendo as inicias separadas por ponto.-->
      <macro name="secondary-contributors">
        <choose>
          <if type="chapter" match="none">
            <names variable="editor" delimiter=", " prefix=" (" suffix=")">
              <name and="symbol" initialize-with=". " delimiter=", "/>
              <label form="short" prefix=", " text-case="capitalize-first" suffix="."/>
            </names>
          </if>
        </choose>
      </macro>
      <!--A macro 'translator' e responsavel por mostrar os nomes dos tradutores, serao apresentados SOBRENOME, INICIAIS PRENOMES
    tendo as inicias separadas por ponto. -->
      <macro name="translator">
        <text value="Traducao "/>
        <names variable="translator" delimiter=", ">
          <name delimiter="; " sort-separator=" " delimiter-precedes-last="always">
            <name-part name="given" text-case="capitalize-first"/>
            <name-part name="family" text-case="capitalize-first"/>
          </name>
          <et-al prefix=" " font-style="italic"/>
        </names>
      </macro>
      <!--A macro 'author' e responsavel por mostrar os nomes dos autores na bibliografia, serao no formato SOBRENOME, INICIAIS PRENOMES, tendo 
    as inicias separadas por ponto. Quando houver mais de tres autores, somente o primeiro sera mostrado e no lugar dos outros
    aparecera a expess o 'et. al.'. Na regra da ABNT essa expressao deve aparecer em fonte normal, mas o IPEA utiliza ela em italico.-->
      <macro name="author">
        <names variable="author">
          <name name-as-sort-order="all" sort-separator=", " initialize-with=". " delimiter="; " delimiter-precedes-last="always">
            <name-part name="family" text-case="uppercase"/>
            <name-part name="given" text-case="uppercase"/>
          </name>
          <et-al prefix=" " font-style="italic"/>
          <label form="short" prefix=" (" suffix=".)" text-case="uppercase"/>
          <substitute>
            <names variable="editor"/>
            <names variable="translator"/>
            <text macro="title"/>
          </substitute>
        </names>
      </macro>
      <!--A macro 'author-short' e responsavel por mostrar os nomes dos autores na citacao (no meio do texto). Nela aparecera apenas o ultimo nome
    do autor. Na regra da ABNT o sobrenome deve aparecer com todas as letras em caixa alta, mas o IPEA utiliza ele em caixa baixa tanto para os nomes,
    quanto para as siglas "soletraveis". A regra do 'et. al.' tambem vale para a citacao-->
      <macro name="author-short">
        <names variable="author">
          <name form="short" name-as-sort-order="all" sort-separator=", " and="text" initialize-with=". " delimiter=", " delimiter-precedes-last="never">
        </name>
          <et-al prefix=" " font-style="italic"/>
          <substitute>
            <names variable="editor"/>
            <names variable="translator"/>
            <choose>
              <if type="book">
                <text variable="title" form="short"/>
              </if>
              <else>
                <text variable="title" form="short" quotes="true"/>
              </else>
            </choose>
          </substitute>
        </names>
      </macro>
      <!--A macro 'access' e utilizada em arquivos de paginas da web. Ela e responsavel por mostrar a URL do site pesquisado e a data do acesso-->
      <macro name="access">
        <text variable="URL" prefix="Disponível em: &lt;" suffix="&gt;"/>
        <date variable="accessed" prefix=". Acesso em: ">
          <date-part name="day" suffix=" "/>
          <date-part name="month" form="short" suffix=". " text-case="lowercase"/>
          <date-part name="year"/>
        </date>
      </macro>
      <!--A macro 'title' e responsavel por mostrar o titulo principal do arquivo. Em todos os tipos ele aparecera em negrito logo apos os nomes dos
    autores, exceto em arquivos do tipo 'artigo de jornal, artigo de revista, artigo de periodico', nesses arquivos eles irao aparecer em fonte normal.-->
      <macro name="title">
        <choose>
          <if type="chapter bill" match="any">
            <text variable="title"/>
          </if>
          <else-if type="book thesis" match="any">
            <text variable="title" font-weight="bold"/>
          </else-if>
          <else-if type="article-newspaper article-magazine article-journal" match="any">
            <text variable="title"/>
          </else-if>
          <else>
            <text variable="title" font-weight="bold"/>
          </else>
        </choose>
      </macro>
      <!-- Titulo dos Anais-->
      <macro name="container-title">
        <choose>
          <if type="paper-conference" match="any">
            <text variable="container-title" suffix=". "/>
            <text value="Anais" font-weight="bold"/>
            <text value="..."/>
          </if>
          <else>
            <text variable="container-title" font-weight="bold"/>
          </else>
        </choose>
      </macro>
      <!--A macro 'publisher' e responsavel por mostrar o nome da editora responsavel pela publicacao-->
      <macro name="publisher">
        <choose>
          <if match="any" variable="publisher-place publisher">
            <choose>
              <if variable="publisher-place">
                <text variable="publisher-place" suffix=": "/>
              </if>
              <else-if type="entry-encyclopedia">
            </else-if>
              <else>
                <text value="[s.l.] "/>
              </else>
            </choose>
            <choose>
              <if variable="publisher">
                <text variable="publisher" suffix=", "/>
                <text macro="issued"/>
              </if>
              <else>
                <text value="[s.n.]"/>
              </else>
            </choose>
          </if>
          <else>
            <text value="[s.l: s.n.]"/>
          </else>
        </choose>
      </macro>
      <!--A macro 'event' sera utilizada em arquivos do tipo Evento/Conferencia. Ela e responsavel por mostrar o nome da conferencia, que tera formatacao
    em caixa alta. Utiliza-se antes do nome da conferencia a expressao "In". Segundo a regra da ABNT ela deve ser em fonte normal, mas o IPEA 
    a ulitiliza em italico-->
      <macro name="event">
        <choose>
          <if variable="event">
            <choose>
              <if variable="genre" match="none">
                <text term="in" font-style="italic" text-case="capitalize-first" suffix=": "/>
                <text variable="event" text-case="uppercase"/>
              </if>
              <else>
                <group delimiter=" ">
                  <text variable="genre" text-case="capitalize-first"/>
                  <text term="presented at"/>
                  <text variable="event"/>
                </group>
              </else>
            </choose>
          </if>
        </choose>
      </macro>
      <!--A macro 'issued' e utilizada quando devemos mostrar a data completa exemplo: 03 mar. 2011.-->
      <macro name="issued">
        <choose>
          <if variable="issued" match="any">
            <group>
              <choose>
                <if type="book chapter" match="none">
                  <date variable="issued">
                    <date-part name="day" suffix=" "/>
                    <date-part name="month" form="short" suffix=". " strip-periods="true"/>
                  </date>
                </if>
              </choose>
              <date variable="issued">
                <date-part name="year"/>
              </date>
            </group>
          </if>
          <else>
            <text value="[s.d.]"/>
          </else>
        </choose>
      </macro>
      <!--A macro 'issued' e utilizada quando desejamos que apareca apenas o ano-->
      <macro name="issued-year">
        <choose>
          <if variable="issued" match="any">
            <date variable="issued">
              <date-part name="year"/>
            </date>
          </if>
          <else>
            <text value="[s.d.]"/>
          </else>
        </choose>
      </macro>
      <!--A macro 'edition' e responsavel por mostrar o numero da edicao.-->
      <macro name="edition">
        <choose>
          <!--Se for capitulo de livro aparecera somente o numero-->
          <if type="book chapter" match="any">
            <choose>
              <if is-numeric="edition">
                <group delimiter=" ">
                  <number variable="edition" form="numeric" suffix="."/>
                  <text term="edition" form="short" suffix="."/>
                </group>
              </if>
              <else>
                <!--Se for outro tipo de documento aparera o numero e depois a descricao "ed."-->
                <text variable="edition" suffix=" ed."/>
              </else>
            </choose>
          </if>
        </choose>
      </macro>
      <!--A macro 'locators'tem como funcao mostrar os dados complementares do arquivo (paginas, secao, volume, etc)-->
      <macro name="locators">
        <choose>
          <!--Se for projeto de lei mostrara o dia, mes "forma curta", ano, secao "Sec." e pagina "p."-->
          <if type="bill">
            <group prefix=". " suffix="" delimiter=", ">
              <date variable="issued">
                <date-part name="day"/>
                <date-part prefix=" " name="month" form="short"/>
                <date-part prefix=" " name="year"/>
              </date>
              <text variable="section" prefix="Sec. "/>
              <text variable="page" prefix="p. " suffix="."/>
            </group>
          </if>
          <!--Se for artigos de jornal, revista, etc. Aparecera o volume "v.", edicao "n." e a pagina do artigo "p."-->
          <else-if match="any" type="article-journal article-magazine article-newspaper">
            <group delimiter=", ">
              <group delimiter=", ">
                <text variable="volume" prefix="v. "/>
                <text variable="issue" prefix="n. " suffix=""/>
              </group>
              <text variable="page" prefix="p. "/>
            </group>
          </else-if>
          <!--Se for capitulo de livro aparecera o volume "v." e a pagina "p."-->
          <else-if match="any" type="book chapter">
            <group delimiter=", ">
              <group>
                <text variable="volume" prefix="v. "/>
                <text variable="page" prefix="p. "/>
              </group>
            </group>
          </else-if>
        </choose>
      </macro>
      <!--Resumo-->
      <macro name="abstract">
        <text variable="abstract"/>
      </macro>
      <!--Mostra a ISBN-->
      <macro name="ISBN">
        <group>
          <text variable="ISBN" prefix="ISBN "/>
        </group>
      </macro>
      <macro name="collection-title">
        <text variable="collection-title"/>
        <text variable="collection-number" prefix=" "/>
      </macro>
      <!--Citacao-->
      <!--et al. aparece a partir de 04 autores-->
      <citation et-al-min="4" et-al-use-first="1" et-al-subsequent-min="4" et-al-subsequent-use-first="1" collapse="year">
        <sort>
          <key macro="author"/>
          <!--Puxa o autor primeiro-->
          <key variable="issued"/>
          <!--Depois o ano-->
        </sort>
        <layout prefix="(" suffix=")" delimiter="; ">
          <!--Entre parenteses separando os autores com ponto-e-virgula-->
          <group>
            <text suffix=", " macro="author-short"/>
            <!--Seperando os autores das datas usando virgula-->
            <text macro="issued-year"/>
            <text prefix=", " macro="citation-locator"/>
          </group>
        </layout>
      </citation>
      <!--Bibliografia-->
      <!--et al. aparece a partir de 04 autores-->
      <bibliography hanging-indent="false" et-al-min="4" et-al-use-first="1" entry-spacing="0">
        <sort>
          <key macro="author"/>
          <!--Puxa o autor primeiro-->
          <key variable="issued"/>
          <!--Depois o ano-->
        </sort>
        <layout>
          <choose>
            <!--Projeto de lei-->
            <if type="bill">
              <group>
                <text macro="author" suffix=". "/>
                <!--autor-->
                <text variable="number" suffix=". "/>
                <!--Numero da lei-->
                <text macro="title" suffix=". "/>
                <!--Titulo-->
                <text variable="references" font-weight="bold"/>
                <!--Historico em negrito-->
                <text variable="note"/>
                <!--Campo 'extra' caso queira colocar alguma observacao-->
                <text macro="locators" suffix=". "/>
                <!--Dados complementares "secao, pagina"-->
              </group>
            </if>
            <!--Mapa-->
            <else-if type="map">
              <group>
                <text macro="author" suffix=". "/>
                <!--autor-->
                <text macro="title" suffix=", "/>
                <!--Titulo-->
                <text macro="issued" suffix=". "/>
                <!--data-->
                <text variable="note" suffix=". "/>
                <!--Campo 'extra' caso queira colocar alguma observacao-->
              </group>
            </else-if>
            <!--Livro-->
            <else-if type="book">
              <group>
                <text macro="author" suffix=". "/>
                <!--autor-->
                <text macro="title" suffix=". "/>
                <!--Titulo-->
                <text macro="translator" suffix=". "/>
                <!--Traducao-->
                <text macro="edition" suffix=". "/>
                <!--Edicao-->
                <text macro="publisher" suffix=". "/>
                <!--Local, data, etc-->
                <text macro="locators"/>
                <!--Dados complementares "pagina, volume"-->
              </group>
            </else-if>
            <!--Conferencia-->
            <else-if type="chapter">
              <group>
                <text macro="author" suffix=". "/>
                <!--autor-->
                <text macro="title" suffix=". "/>
                <!--Titulo-->
                <text macro="secondary-contributors" suffix=". "/>
                <text term="in" font-style="italic" text-case="capitalize-first" suffix=": "/>
                <!--In:-->
                <text macro="container-contributors" suffix=". "/>
                <!--Nomes de editores-->
                <text macro="container-title" suffix=". "/>
                <!--Titulo da conferencia-->
                <text variable="collection-title" suffix=". "/>
                <text macro="translator" suffix=". "/>
                <!--Traducao-->
                <text macro="edition" suffix=". "/>
                <!--Edicao-->
                <group suffix=". ">
                  <text macro="publisher" suffix=". "/>
                  <!--Local, data, etc-->
                  <text macro="locators"/>
                  <!--Dados complementares "pagina, volume"-->
                </group>
              </group>
            </else-if>
            <!--Artigo de revista, jornal, etc-->
            <else-if type="article-newspaper article-magazine article-journal" match="any">
              <group>
                <text macro="author" suffix=". "/>
                <!--Autor-->
                <text macro="title" suffix=". "/>
                <!--Titulo do artigo-->
                <text macro="container-title" suffix=", "/>
                <!--Titulo da publicacao-->
                <text variable="collection-title" suffix=". "/>
                <!--Titulo da serie-->
                <text macro="edition" suffix=", "/>
                <!--Edicao-->
                <text macro="locators" suffix=", "/>
                <!--Dados complementares "pagina, volume"-->
                <text macro="issued" suffix=". "/>
                <!--Data-->
              </group>
            </else-if>
            <!--Tese-->
            <else-if type="thesis">
              <group>
                <text macro="author" suffix=". "/>
                <!--Autor-->
                <text macro="title" suffix=". "/>
                <!--Titulo-->
                <text macro="edition" suffix=". "/>
                <!--Edicao-->
                <text macro="publisher" suffix="."/>
                <!--Local, data, etc-->
              </group>
            </else-if>
            <!-- Nao ha norma ABNT para manuscritos -->
            <else-if type="manuscript">
              <group>
                <text macro="author" suffix=". "/>
                <!--Autor-->
                <text macro="title" suffix=". "/>
                <!--Titulo-->
                <text macro="edition" suffix=". "/>
                <!--Edicao-->
                <text macro="place" suffix=", "/>
                <text macro="issued" suffix=". "/>
                <!--Data-->
                <text macro="access" suffix=". "/>
                <!--URL, data do acesso-->
                <text macro="archive" suffix=". "/>
                <!--Arquive-->
              </group>
            </else-if>
            <!--Pagina da WEB-->
            <else-if type="webpage">
              <group>
                <text macro="author" suffix=". "/>
                <!--Autor-->
                <text macro="title" suffix=". "/>
                <!--Titulo-->
                <text macro="genre" suffix=". "/>
                <text macro="access" suffix=". "/>
                <!--URL, data do acesso-->
              </group>
            </else-if>
            <!--Relatorio-->
            <else-if type="report">
              <group>
                <text macro="author" suffix=". "/>
                <!--Autor-->
                <text macro="title"/>
                <!--Titulo-->
                <text macro="container-contributors"/>
                <!--Nomes de editores-->
                <text macro="secondary-contributors"/>
                <text macro="container-title"/>
                <!--Titulo da publicacao-->
                <text variable="collection-title" prefix=": " suffix=""/>
                <text macro="locators"/>
                <!--Dados complementares "pagina, volume"-->
                <text macro="event"/>
                <!--Nome do evento, conferencia-->
                <text macro="publisher" prefix=". " suffix=". "/>
                <!--Local, data, etc-->
                <text macro="access" suffix="."/>
                <!--URL, data do acesso-->
              </group>
            </else-if>
            <!--Texto para Discussao (Verbete de Dicionario)-->
            <else-if type="entry-dictionary">
              <group>
                <text macro="author" suffix=". "/>
                <!--Autor-->
                <text macro="title"/>
                <!--Titulo-->
                <text macro="container-contributors"/>
                <!--Nomes de editores-->
                <text macro="secondary-contributors"/>
                <text macro="container-title"/>
                <!--Titulo da publicacao-->
                <text variable="collection-title" prefix=": " suffix=". "/>
                <text macro="locators"/>
                <!--Dados complementares "pagina, volume"-->
                <text macro="event"/>
                <!--Nome do evento, conferencia-->
                <text macro="publisher" prefix=". " suffix=". "/>
                <!--Local, data, etc-->
                <text macro="collection-title" prefix="(Texto para discussao, n. " suffix=")."/>
                <text macro="access"/>
                <!--URL, data do acesso-->
              </group>
            </else-if>
            <!--Nota Tecnica (Verbete de Enciclopedia)-->
            <else-if type="entry-encyclopedia">
              <group>
                <text macro="author" suffix=". "/>
                <!--Autor-->
                <text macro="title"/>
                <!--Titulo-->
                <text variable="publisher-place" prefix=". " suffix=": "/>
                <!--Local-->
                <text variable="publisher" suffix=", "/>
                <!--Editor-->
                <text macro="issued" prefix=", " suffix=". (Nota técnica)."/>
                <!--Data-->
              </group>
            </else-if>
            <else-if type="paper-conference">
              <text macro="author" suffix=". "/>
              <!--Autor-->
              <text macro="title"/>
              <!--Titulo-->
              <text macro="container-contributors"/>
              <!--Nomes de editore-->
              <text macro="secondary-contributors"/>
              <text macro="container-title"/>
              <!--Titulo da publicacao-->
              <text variable="collection-title" prefix=": " suffix="."/>
              <text macro="locators"/>
              <!--Dados complementares "pagina, volume"-->
              <group delimiter=". " prefix=". " suffix=". ">
                <text macro="event"/>
                <!--Nome do evento, conferencia-->
              </group>
              <text variable="publisher-place" suffix=": "/>
              <!--Local-->
              <text variable="publisher" suffix=", "/>
              <!--Editor-->
              <text macro="issued"/>
              <!--Data-->
              <text macro="access"/>
              <!--URL, data do acesso-->
            </else-if>
            <else>
              <text macro="author" suffix=". "/>
              <!--Autor-->
              <text macro="title"/>
              <!--Titulo-->
              <text macro="container-contributors"/>
              <!--Nomes de editore-->
              <text macro="secondary-contributors"/>
              <text macro="container-title"/>
              <!--Titulo da publicacao-->
              <text variable="collection-title" prefix=": " suffix="."/>
              <text macro="locators"/>
              <!--Dados complementares "pagina, volume"-->
              <group delimiter=". " prefix=". " suffix=". ">
                <text macro="event"/>
                <!--Nome do evento, conferencia-->
              </group>
              <text variable="publisher-place"/>
              <!--Local-->
              <text variable="publisher" suffix=", "/>
              <!--Editor-->
              <text macro="issued" prefix=", " suffix=". "/>
              <!--Data-->
              <text macro="access"/>
              <!--URL, data do acesso-->
            </else>
          </choose>
        </layout>
      </bibliography>
      <!--As macros abaixo nao foram utilizadas na bibliografia-->
      <macro name="citation-locator">
        <group>
          <label variable="locator" form="short"/>
          <text variable="locator" prefix=" "/>
        </group>
      </macro>
      <macro name="genre">
        <text variable="genre"/>
      </macro>
      <macro name="place">
        <choose>
          <if match="any" variable="publisher-place">
            <text variable="publisher-place"/>
          </if>
        </choose>
      </macro>
      <macro name="archive">
        <group>
          <text variable="archive" prefix=" "/>
        </group>
      </macro>
    </style>

    """
    And the following input:
    """
    [{"DOI":"10.1016/j.jhydrol.2008.05.025","ISSN":"0022-1694","author":[{"family":"Cole","given":"Steven J."},{"family":"Moore","given":"Robert"}],"container-title":"Journal of Hydrology","id":"ITEM-1","issue":"3-4","issued":{"date-parts":[[2008]]},"page":"159-181","title":"Hydrological modelling using raingauge- and radar-based estimators of areal rainfall","type":"article-journal","url":"http://www.sciencedirect.com/science/article/pii/S0022169408002394","volume":"358"}]
    """
    When I render the entire bibliography
    Then the bibliography should be:
    """
    <div class="csl-bib-body">
      <div class="csl-entry">COLE, S. J.; MOORE, R. Hydrological modelling using raingauge- and radar-based estimators of areal rainfall. <b>Journal of Hydrology</b>, v. 358, n. 3-4, p. 159–181, 2008. </div>
    </div>
    """
