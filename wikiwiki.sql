-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 10-04-2023 a las 22:50:27
-- Versión del servidor: 10.4.18-MariaDB
-- Versión de PHP: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `wikiwiki`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `articles_article`
--

CREATE TABLE `articles_article` (
  `id` bigint(20) NOT NULL,
  `title` varchar(40) NOT NULL,
  `other_names` longtext DEFAULT NULL,
  `main` longtext NOT NULL,
  `views` bigint(20) UNSIGNED DEFAULT NULL,
  `created` datetime(6) NOT NULL,
  `summary_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `articles_article`
--

INSERT INTO `articles_article` (`id`, `title`, `other_names`, `main`, `views`, `created`, `summary_id`) VALUES
(6, 'Simón Bolívar', 'El Libertador, Simón José Antonio de la Santísima Trinidad Bolívar Ponte y Palacios Blanco', 'Simón José Antonio de la Santísima Trinidad Bolívar Ponte y Palacios Blanco (Caracas, July 24, 1783, Santa Marta - December 17, 1830), better known as Simón Bolívar or the Liberator, was a Venezuelan military and politician. He contributed to the independence of Venezuela, Colombia, in specifying that of Peru, in being the inspiration in the revolutionaries of Panama in their last stage of independence,18 in being involved in the independence of Ecuador and in the founding question of Bolivia. He stood out as a prominent figure of the Spanish-American emancipation against the Spanish Empire, for his actions he was awarded the title of El Libertador for his independence actions in Venezuela.\r\n\r\nHe led the campaigns that gave independence to several American nations, he was also the founder of Gran Colombia. He was also a legislator and drafter of constitutions, environmentalist and jurist. He carried out the Amphictyonic Congress of Panama, to create a Spanish-American confederation, which would unite from Mexico to Argentina, however due to internal political and economic conflicts in Greater Colombia, he could not continue with this emancipatory project that included Cuba, Puerto Rico , Florida and military support for the independence of the United Provinces of the Río de la Plata.\r\n\r\nHe had a political conflict with his field assistant Antonio José de Sucre, who together with Casimiro Olañeta had intentions of creating a new State on the margin of the provinces of Upper Peru. When the new State was founded, which Bolívar did not recognize, the deliberative assembly to recognize it called the nascent State the Bolívar Republic and later the Bolivian Republic or Bolivia, in honor of the Liberator.', 63, '2023-04-10 20:30:02.107439', 6),
(7, 'Gran Colombia', '', 'Gran Colombia, officially the Republic of Colombia, was an American state, created by the Angostura Congress of 1819, through the Fundamental Law of the Republic, and later ratified by its counterpart Congress of 1821, which united Venezuela and New Granada. into a single nation, to which Panama (1821), Quito and Guayaquil (1822) later joined. The name Gran Colombia is used by historiography to differentiate it from the current Republic of Colombia.\r\n\r\nThis republic existed legally between 1821 and 1831 and was formed from the union of the administrative entities corresponding to the previous Viceroyalty of New Granada, the General Captaincy of Venezuela, the Royal Court of Quito and the Government of Guayaquil. Its surface corresponded to the territories of the current republics of Colombia, Ecuador, Panama and Venezuela —including Guayana Esequiba, in Guyano-Venezuelan claim—; and other territories in dispute with the Federal Republic of Central America, the Empire of Brazil and Peru that each ex-member country inherited after the dissolution of Gran Colombia as border conflicts.\r\n\r\nAlthough Gran Colombia was created by means of the Fundamental Law of the Republic of Colombia, issued during the Congress of Angostura (1819), the State as a result of the union of said territories did not see the light until the Congress of Colombia (1821), where the national Constitution was drafted with which its creation was implemented and regulated, as well as the political and institutional life of the new country. The political-administrative system adopted by the republic was unitary centralism.\r\n\r\nOn the other hand, the international recognition of the legitimate existence of Gran Colombia, as an independent, sovereign and delimited territory, was registered in a diplomatic context that in Europe was adverse to the formal recognition of the independence of the American countries. Thus, Austria, France and Russia only recognized independence in America if the new states submitted to a monarchical system, naming members of European dynasties as sovereigns.\r\n\r\nAt the time of its creation, Gran Colombia was the Spanish-American country with the greatest international prestige, so much so that various politicians in Europe and America, including John Quincy Adams, then Secretary of State and future president of the United States, envisioned it as a of the most powerful nations on the planet. This prestige, added to the figure of Bolívar, attracted to the nation unionist ideas of independence movements in Cuba, Spanish Haiti and Puerto Rico, which sought to form a state associated with the republic.\r\n\r\nThe country dissolved in the late 1820s and early 1830s, due to the political differences that existed between supporters of federalism and centralism, as well as regional tensions between the peoples that made up the republic. There are still people who clamor for the reunification of Gran Colombia.', 14, '2023-04-07 16:35:27.934679', 7),
(8, 'Francisco de Miranda', 'Sebastián Francisco de Miranda y Rodríguez Espinoza', 'Sebastián Francisco de Miranda y Rodríguez Espinoza (Caracas, March 28, 1750-San Fernando, July 14, 1816), known as Francisco de Miranda, was a Venezuelan politician, soldier, diplomat, writer, humanist and ideologue, considered the precursor of American emancipation against the Spanish empire. Known as the first universal Venezuelan and the most universal American, he participated in the independence of the United States and in the French Revolution, an event in which he was a prominent protagonist for which he was awarded the title of hero of the revolution. Later he was leader of the patriot side in the independence of Venezuela.\r\n\r\nHe stood out in politics as a staunch defender of the independence and sovereignty of nations in the international arena. He was a member of the Girondins in France, he was a signatory of the Act of the Declaration of Independence of Venezuela and promoter and leader of the Patriotic Society. He was also the creator of the geopolitical project known as Gran Colombia, which Simón Bolívar would try to carry out in 1826 after the liberation of the territories that today make up Colombia, Panama, Ecuador and Venezuela; aspiring to unify them into a single nation.\r\n\r\nThe soldier in the ranks of the Spanish and French armies reached the ranks of colonel and marshal, respectively. In addition, he obtained the rank of colonel in the Russian army, granted by Catherine II the Great, and was the first commander-in-chief of the Venezuelan armies, holding the title of generalissimo. His military career includes his participation in four wars: the siege of Melilla (1774-1775) and the Spanish invasion of Algiers in North Africa in 1775, the American war of independence, the French revolutionary wars and the Venezuelan war of independence. . Among his military feats, his actions in the siege of Melilla, the battle of Pensacola in the United States and the battle of Valmy in France stand out. Miranda was a prominent combatant on three continents: Africa, America and Europe.2\r\n\r\nDespite having been part of so many revolutionary and governmental processes in the international arena, he failed to put his projects into practice in his own country, Venezuela. However, his political ideal endured over time and served as the basis for the founding of Gran Colombia, while his independence ideas influenced prominent leaders of American emancipation such as Simón Bolívar in Venezuela and Bernardo O\'Higgins in Chile.3\r\n\r\nHis name is engraved on the Arc de Triomphe in Paris, his portrait is part of the Gallery of Characters in the Palace of Versailles, and his statue stands in front of that of General Kellerman in the Champ de Valmy, France.', 13, '2023-04-07 14:06:38.339348', 8),
(9, 'Trinidad and Tovago', 'Trinity and Tovago, Republic of Trinity and Tobago, República de Trinidad and Tobago', 'Trinidad and Tobago, officially the Republic of Trinidad and Tobago, is a sovereign island country located in the Caribbean Sea, in the northern region of South America. Made up of the main islands, Trinidad and Tobago, and numerous other much smaller islands, it is located 130 kilometers south of Grenada and 11 kilometers off the northeast coast of Venezuela.\r\n\r\nIn addition, it shares maritime borders with Barbados to the northeast, Grenada to the northwest, and Venezuela to the south and west. Trinidad and Tobago is generally considered to be part of the Antilles. According to some geographical definitions, Trinidad and Tobago is also part of the Windward Islands and the Lesser Antilles, while other definitions consider it to be part of the South American continent.\r\n\r\nTrinidad was inhabited for centuries by Amerindian peoples before becoming a colony of the Spanish Empire, following the arrival of Christopher Columbus in 1498. Spanish Governor José María Chacón turned it over to a British fleet under Ralph Abercromby in 1797. During the In the same period, Tobago changed hands between Spanish, British, French and Dutch settlers more times than any other in the Caribbean. Trinidad and Tobago was ceded to Great Britain in 1802 under the Treaty of Amiens as separate states and united in 1889. Trinidad and Tobago gained independence in 1962 and became a republic in 1976.\r\n\r\nTrinidad and Tobago has the third highest GDP per capita in the Americas, according to purchasing power parity (PPP), after the United States and Canada.9 It is recognized by the World Bank as a high-income economy. most of the Caribbean nations and territories, which are highly dependent on tourism, the economy is primarily industrial, with an emphasis on oil and petrochemicals; much of the nation\'s wealth is derived from its vast reserves of oil and natural gas.\r\n\r\nTrinidad and Tobago is known for its African and Indian cultures, which are reflected in its great and famous celebrations of Carnival, Diwali and Hosay, as well as being the birthplace of steelpan, limbo and musical styles such as calypso, soca , rapso, parang, chutney and soca chutney.​', 6, '2023-04-07 14:13:57.221561', 9),
(10, 'Caracazo', '', 'El Caracazo is the name of a series of strong protests, riots and looting in Venezuela that began on February 27, 1989 in Guarenas, extended to Caracas and ended on March 8 of the same year. The protests and riots began mainly in response to the economic measures announced during the government of Carlos Andrés Pérez, which included an increase in gasoline and the cost of urban transportation. The name of the event comes from Caracas, the city where most of the events took place. The death toll began on February 27 when security forces from the Metropolitan Police, the Armed Forces of the Army and the National Guard took to the streets to control the situation. Although official figures report 276 deaths, some unofficial reports speak of more than 3,000 deaths. Until then Venezuela had been one of the most stable countries in Latin America.', 13, '2023-04-07 14:06:32.540848', 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `articles_article_category`
--

CREATE TABLE `articles_article_category` (
  `id` bigint(20) NOT NULL,
  `article_id` bigint(20) NOT NULL,
  `category_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `articles_article_category`
--

INSERT INTO `articles_article_category` (`id`, `article_id`, `category_id`) VALUES
(6, 6, 6),
(7, 7, 7),
(8, 8, 6),
(9, 9, 7),
(10, 10, 8);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `articles_article_images`
--

CREATE TABLE `articles_article_images` (
  `id` bigint(20) NOT NULL,
  `article_id` bigint(20) NOT NULL,
  `image_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `articles_article_images`
--

INSERT INTO `articles_article_images` (`id`, `article_id`, `image_id`) VALUES
(8, 6, 13),
(9, 7, 18),
(10, 8, 19),
(11, 8, 22),
(13, 9, 23),
(12, 9, 24),
(14, 10, 26);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `articles_category`
--

CREATE TABLE `articles_category` (
  `id` bigint(20) NOT NULL,
  `name` varchar(30) NOT NULL,
  `img_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `articles_category`
--

INSERT INTO `articles_category` (`id`, `name`, `img_id`) VALUES
(6, 'Heroes', 14),
(7, 'Places', 17),
(8, 'Events', 25);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `articles_image`
--

CREATE TABLE `articles_image` (
  `id` bigint(20) NOT NULL,
  `title` varchar(30) NOT NULL,
  `img` varchar(100) NOT NULL,
  `description` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `articles_image`
--

INSERT INTO `articles_image` (`id`, `title`, `img`, `description`) VALUES
(13, 'Simon Bolivar', 'article_imgs/Simon_Bolivar.jpg', 'Portrait of Bolívar by José Gil de Castro, 1825.'),
(14, 'Heroes', 'article_imgs/heroes.png', ''),
(15, 'Simon Bolivar 17 years old', 'article_imgs/simon_bolivar_17.jpg', 'Portrait of Simón Bolívar at the age of 17 (1801).'),
(16, 'Diplomatic Bolivar', 'article_imgs/Diplomatic_bolivar.jpg', 'The Liberator (Diplomatic Bolívar), 1860. Oil on canvas 107×69 by Aita (pseudonym of Rita Matilde de la Peñuela, 1840-?), located in the art collection of the Central Bank of Venezuela.'),
(17, 'Places', 'article_imgs/places.png', ''),
(18, 'Gran Colombia Map', 'article_imgs/gran_colombia_map.png', 'Departments of Gran Colombia in 1826.'),
(19, 'Francisco de Miranda', 'article_imgs/francisco_de_miranda.jpg', 'Generalissimo Francisco de Miranda by Georges Rouget (1834)'),
(20, 'Epitafio francisco de miranda', 'article_imgs/epitafio_francisco_de_miranda.jpg', 'Epitaph of Francisco de Miranda in the National Pantheon, Caracas, Venezuela.'),
(21, 'Miranda en la carraca', 'article_imgs/miranda_en_la_carraca.jpg', 'Miranda in La Carraca, Arturo Michelena; Miranda\'s last days in prison in San Fernando, historicist painting from 1896: Oil on canvas – 196.6 x 245.5 cm. National Art Gallery, Caracas, Venezuela.'),
(22, 'Francisco with suit', 'article_imgs/francisco_de_miranda_2.jpg', ''),
(23, 'Trinidad and Tobago\'s flag', 'article_imgs/trinidad_y_tobago.png', ''),
(24, 'Trinidad and Tobago location', 'article_imgs/trinidad_y_tobago_location.png', ''),
(25, 'Events', 'article_imgs/events.png', ''),
(26, 'Caracazo', 'article_imgs/caracazo.png', 'Top, left, right: Venezuelans cheering during the rioting. The looting stores in Caracas. Police response during the riots.'),
(27, 'Caracazo smoke', 'article_imgs/caracazo_humo.png', 'Smoke clouds of fire in Caracas'),
(28, 'Caracazo looters', 'article_imgs/caracazo_saqueo.png', 'Venezuelans running with stoled goods'),
(29, 'Militar answer during Caracazo', 'article_imgs/caracazo_militar_answer.png', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `articles_relatedarticles`
--

CREATE TABLE `articles_relatedarticles` (
  `id` bigint(20) NOT NULL,
  `article_title` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `articles_relatedarticles`
--

INSERT INTO `articles_relatedarticles` (`id`, `article_title`) VALUES
(6, 'Simón Bolívar'),
(7, 'Gran Colombia'),
(8, 'Francisco de Miranda');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `articles_relatedarticles_related`
--

CREATE TABLE `articles_relatedarticles_related` (
  `id` bigint(20) NOT NULL,
  `relatedarticles_id` bigint(20) NOT NULL,
  `article_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `articles_relatedarticles_related`
--

INSERT INTO `articles_relatedarticles_related` (`id`, `relatedarticles_id`, `article_id`) VALUES
(9, 6, 7),
(8, 6, 8),
(11, 7, 6),
(10, 7, 8),
(12, 8, 6),
(13, 8, 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `articles_section`
--

CREATE TABLE `articles_section` (
  `id` bigint(20) NOT NULL,
  `title` varchar(40) NOT NULL,
  `content` longtext DEFAULT NULL,
  `order` int(10) UNSIGNED NOT NULL CHECK (`order` >= 0),
  `visible` tinyint(1) NOT NULL,
  `collapse` tinyint(1) NOT NULL,
  `sectionType_id` bigint(20) DEFAULT NULL,
  `targetArticle_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `articles_section`
--

INSERT INTO `articles_section` (`id`, `title`, `content`, `order`, `visible`, `collapse`, `sectionType_id`, `targetArticle_id`) VALUES
(5, 'Biography', 'Bolívar was born on July 24, 1783 in Caracas in the province and city of Caracas Captaincy General of Venezuela (today the Bolivarian Republic of Venezuela). He was the fourth child of the marriage between María de la Concepción Palacios y Blanco and Juan Vicente Bolívar y Ponte. He was born into a wealthy Creole family and as was customary for the heirs of upper class families in his time, he was sent to be educated abroad at an early age. He arrived in Spain when he was 16 years old. At the age of 19 in Madrid, in the church of San José,1920 he married María Teresa del Toro, and returned to Venezuela with his wife, who fell ill and died in 1803, plunging Bolívar into a deep depression and leading him to swear that he would never marry again. At that moment he decided to return to Spain, and then he would go to France, where he was reunited with his teacher Simón Rodríguez, who channels Bolívar\'s suffering towards the ideal of liberating his homeland. In Paris he witnessed the coronation of Napoleon Bonaparte. While he was in Europe, he learned about the ideas of the Enlightenment, which, together with the influence of Simón Rodríguez, motivated him to swear to liberate colonial South America from Spanish rule.', 1, 1, 0, 1, 6),
(6, 'Education', 'Bolívar\'s school career was not very brilliant as a student at the Public School, an institution administered by the Cabildo de Caracas that functioned deficiently due to a lack of resources and organization.\r\n\r\nBack then, Simón Rodríguez was Bolívar\'s teacher at this school. Carlos Palacios y Blanco, Bolívar\'s maternal uncle, planned to send him to live with him because he could not attend to him personally and the protests of his niece María Antonia about the education and attention his brother received were frequent.\r\n\r\nFaced with the prospect of living with his teacher, Simón escaped from his uncle\'s house on July 23, 1795, to take refuge in the house of his sister María Antonia, who exercised his temporary custody, until the judicial dispute in the Royal Court of Caracas that returned custody of Simón to Carlos.\r\n\r\nSimon tried to resist but was forcibly taken from his sister\'s house and carried by a slave to his master\'s house.\r\n\r\nOnce there, the conditions in which he lived with the teacher Rodríguez were not ideal, he had to share the space with 20 people in a house that was not suitable for it, and for this reason Simón escaped from there a couple of times, in which ended up returning by order of the courts.', 2, 1, 0, 2, 6),
(7, 'Political and military life', 'Throughout 1808, the pressures of Napoleon triggered a series of events that further worsened the already compromised Spanish situation, King Carlos IV of Spain abdicated the throne in favor of his son Ferdinand on March 19, 1808 after the events of the mutiny of Aranjuez, and later, on May 5, 1808, the disaster for Spain ended when Carlos IV and his son were forced to cede the throne to Napoleon Bonaparte in Bayonne to designate his brother, José, as the new King of Spain. This caused a great popular reaction in Spain that triggered what is now known as the Spanish War of Independence and both in America and in Spain, regional boards were formed that encouraged the fight against the French invaders to restore the legitimate monarch to the throne. .\r\n\r\nHowever, in the American juntas only the Popular Junta of Cádiz was talked about with enthusiasm and many of them were viewed with suspicion by the Spanish authorities, who suspected them of being favorable to the French and who had not forgotten actions such as that of Antonio Nariño in Bogotá, who had published a work on the Rights of Man, the movement of Juan Picornell, the Conspiracy of Manuel Gual and José María España, or the failed military expeditions of Francisco de Miranda in Venezuela.\r\n\r\nBut at the time they considered that these boards had the right to imitate their analogues on the peninsula; since the Spanish domains were considered an essential and integral part of Spain.\r\n\r\nOver time, two very different factions were formed as a result of political debates and international instability: that of the royalists, who wanted to continue under the direct dependence of the Spanish monarch, led by Juan de Casas; and that of the patriots, in favor of constituting a government Junta with full autonomy similar to that of the provincial Juntas in Spain, but without maintaining more ties with the metropolis other than a formal recognition of Fernando VII as sovereign, thus wanting to imitate the example of Brazil governed from Braganza, with autonomy from Portugal.', 3, 1, 0, 3, 6),
(8, 'Honors', 'In Bogotá, on July 20, 1847, the old main square was renamed as Plaza de Bolívar in his honor. In the center of this square, the first full-length statue has been erected since the mid-19th century, sculpted in 1844 by Pietro Tenerani. The main squares of all the towns in Colombia have been baptized with this name. A department of the Caribbean Coast also receives the name of Bolívar.#;\r\nIn Venezuela, almost all the capitals of the municipalities have a Bolívar square, there are parks, monuments, towns and municipalities with his name, the largest state in Venezuela, in the southeast of the same country, also has his name. All the South American countries independent from Spain have important departments, sites, squares, streets or monuments dedicated to Bolívar.#;\r\nIn the city of Panama, a monument is erected in his honor located in a square that bears the name of Plaza Bolívar. On one side of this square is the Bolívar Palace, headquarters of the Chancellery of the Republic of Panama. Inside the building is the \"Anfictionic Hall\" where the Congress of Panama will be held, in this room rests a sword of Bolívar.#;\r\nThe main avenue of Barranquilla, Colombia, has been called Paseo de Bolívar since 1937. At its northern end is a square with the equestrian statue of Bolívar. A populous neighborhood founded in 1958 also bears the name of Simón Bolívar.#;\r\nIn Socha, Colombia, there is a bust of Bolívar, commemorating the Route of the Liberators.#;\r\nIn Argentina, the city of San Carlos de Bolívar, head of the Bolívar Party in the Province of Buenos Aires, was founded in his honor. In the City of Buenos Aires, in the center of Rivadavia Park stands a monument that bears his name, made by the sculptor José Fioravanti, inaugurated on October 28, 1942; The sculpture is formed by an arch of straight lines 11 meters high and 22 meters wide, with an inscription that says: \"To Simón Bolívar, the Argentine Nation\" accompanied by four bas-reliefs and, in the center of the sculpture, a statue of the Liberator In addition, in the same city of Buenos Aires, there is a street, in front of the Plaza de Mayo, and a subway station that bear his name.#;\r\nIn Ecuador there is a province designated with his name in the Inter-Andean region. There are two cantons named Bolívar in the country (in the provinces of Manabí and Carchi) and one called Simón Bolívar in the Province of Guayas. In the city of Guayaquil, the avenue that is located on the banks of the Guayas River is called Malecón Simón Bolívar. In the same city, Parque Seminario (also known as Parque Bolívar and colloquially as Parque de las Iguanas) has a monument in his honor in its center.#;\r\nIn Paris there is the Estación de Bolívar metro station.#;\r\nIn Santiago de Chile there is the Simón Bolívar metro station, on line 4.#;\r\nIn Brussels, Simón Bolívar Boulevard (Simon Bolivarlaan) begins at the entrance to the North Train Station. A bust of Bolívar has been installed in 2011.#;\r\nIn various cities throughout the world there are names of streets and avenues such as Simón Bolívar avenue in Paris, Simón Bolívar street in Berlin, Bremen and Leipzig, Simón Bolívar street in Ankara, Simón Bolívar street in Utrecht, Simón Bolívar street in Bolívar in Windhoek, Simón Bolívar Square in Cairo, Simón Bolívar Avenue in New Orleans, Simón Bolívar Boulevard in Tehran among others.#;\r\nIn Santa Cruz de Tenerife, a city that has been twinned with Caracas since 1981154 due to the historical links between the Canary Islands and Venezuela, there is a bust of Bolívar on Benito Pérez Armas street, at the end of Venezuela avenue. Also on the island of Tenerife there are two other busts, one in San Cristóbal de La Laguna and another in Garachico, the latter town where part of his ancestors came from. #;\r\nIn Cádiz, Spain, stands a monument to Simón Bolívar, a gift from Venezuela to the city of Cádiz. In front of it is the Simón Bolívar Lecture Hall of the University of Cádiz.#;\r\nIn the Parque del Oeste in Madrid is the Monument to Simón Bolívar.#;\r\nOn the Barceloneta promenade, in Barcelona, ​​Spain, there is a statue of Simón Bolívar inaugurated in 1996 during the government of Rafael Caldera, and made by the sculptor Julio Maragall.#;\r\nIn Seville, Spain, is the Monument to Simón Bolívar.#;\r\nAs of December 30, 1999, the official name of Venezuela, Republic of Venezuela, changed to \"Bolivarian Republic of Venezuela\" in honor of Bolívar.#;\r\nIn Peru various provinces bear his name, institutions, schools, streets, etc. Likewise, the Plaza del Congreso (former Plaza of the Inquisition in Lima) has a monument to Bolívar. The house where he lived in the Pueblo Libre district is a museum. However, in view of the results of his actions, in that country he is a controversial character, which has divided historians, with diverse literature on the matter. #;\r\nAirports, railways, subways and stations, as well as numerous public schools and universities in Latin America bear his name.#;\r\nIn Mexico, in the state of Durango, there is a municipality that bears the name General Simón Bolívar. The municipality of General Simón Bolívar adjoins the municipality that bears the name of the first Mexican president (a native of Durango) Guadalupe Victoria, who sent money to Bolívar for the independence of Peru.#;\r\nCiudad Bolívar, capital of the largest state in Venezuela, the Bolívar state.#;\r\nThe monetary unit of Venezuela has its name, \"bolívar\".#;\r\nHis documents kept in museums around the world, about his thoughts and his environment. Most of them are exhibited in the Latin American region, mainly in the countries where he was the protagonist of the independence struggle.#;\r\nOne of the most important universities in Venezuela is the Simón Bolívar University, which offers scientific and technological undergraduate degrees, as well as postgraduate studies in various areas such as music, political science, philosophy, as well as science and technology.#;\r\nIn Bogotá, one of the 20 locations is called Ciudad Bolívar, the largest park in the city is the Simón Bolívar Metropolitan Park, which has sports facilities, a lake, cycle paths, a library, a museum, a high-performance sports center, a athletics, coliseum, event square for 100,000 people.#;\r\nIn Colombia the official currency is the Colombian peso. Simón Bolívar is the image of the 1 and 2 peso coins and the 20 peso coin. It is also the image of the 1,000-peso (blue: 1982-1994) and 2,000-peso (ochre, 1983-1994) bills.#;\r\nIn the Dominican Republic, one of the main avenues in the city of Santo Domingo bears his name; It is located to the southwest of the city, and there are numerous important premises and buildings, as well as national houses of different parties in the country. At the intersection of this with Máximo Gómez avenue, the Simón Bolívar Square of Santo Domingo is located, inaugurated on November 6, 2004 with the assistance of presidents Leonel Fernández and Hugo Chávez.#;\r\nIn Nicaragua, one of the main avenues in the capital Managua is named after Bolívar in his honor.#;\r\nIn Costa Rica, there is a monument in Parque Morazán. The national zoo and botanical garden also located in the capital bear his name.#;\r\nThe most important soccer tournament in America was named, the Copa Libertadores de América, in honor of the heroes of South American history: Bolívar, Bernardo O\'Higgins, José de San Martín, Pedro I, among others.#;\r\nIn the Normandía neighborhood of Bogotá there is the \"Simón Bolívar\" Military College, founded in 1977, under the ideals of Bolívar. In its field of stops a monument to Simón Bolívar is erected. In addition, this institution pays tribute to him in the Plaza de Bolívar every July 24, Bolívar\'s birthday.#;\r\nIn Lisbon, Portugal, there is a statue in his honor, in one of the main avenues of the city, Avenida da Liberdade.#;\r\nIn the city of New York, United States, there is an equestrian statue in his honor, at one of the entrances to Central Park, specifically at the intersection of 6th avenue and 57th street. The base is adorned by the shields of arms from Venezuela, Colombia, Panama, Ecuador, Peru and Bolivia.#;\r\nIn a BBC Mundo contest, Rubén Darío and Simón Bolívar were chosen as «Personage of the Millennium».#;\r\nIn Havana - (Cuba) in Plaza Venezuela, there is an equestrian statue cast in bronze, a replica of the one that exists in Caracas. It is located on Ave. Los Presidentes between 13th and 15th streets, in the El Vedado neighborhood. In Old Havana since 1993, the Simón Bolívar House Museum stands out, on Mercaderes street, between Obra Pía and Lamparilla. Precisely on Mercaderes street, a few meters away is the Simón Bolívar Park, with its distinctive allegorical sculpture of the martyr that gives it its name.#;\r\nIn Austria, in the city of Vienna, in the Donaupark park there is a statue of Simón Bolívar, by the sculptor Hugo Daini.#;\r\nIn the United Kingdom, in the city of London, a statue is located in the southeast corner of Belgrave Square. The sculpture is the work of Hugo Daini.', 3, 1, 0, 5, 6),
(9, 'Place name', 'The name Colombia is given to the ideal of integration of all of South America proposed by Simón Bolívar. In 1815, on the island of Jamaica. Bolívar proposed the idea of ​​Francisco de Miranda to designate the name of Colombia for a great Spanish-American nation, and the latter who had been inspired by the Italian surname of the discoverer of the new continent \"Colombo\" to invent the name.\r\n\r\nThe idea of ​​a great Spanish-American nation of Francisco de Miranda arose from his decision to call Colombia, in homage to Christopher Columbus, in the plans developed since 1790, which he presented to the Latin American public opinion and to the British and American governments, collected in his work Colombeia, likewise, at the beginning of 1808 founded a newspaper in London called El Colombiano. By 1810 Bolívar moved to London and became a disciple of Miranda, as well as San Martín, O\'Higgins, Nariño, Madariaga and other great Spanish-American men who left there to make Miranda\'s dreams and plans come true. For this reason, the Congress that created the Republic in 1819 acquired the name invented by Miranda.', 1, 1, 0, 1, 7),
(10, 'History', 'In 1816, Simón Bolívar, with the help of generals Urdaneta, Piar, Páez, Mariño, Nariño, Monagas, among others, achieved a series of victories over the royalists. After liberating Guayana and New Granada, he proclaimed his foundation on December 17, 1819 in Angostura (now Ciudad Bolívar). The last royalist contingents in Venezuela were defeated in the historic Battle of Carabobo on June 24, 1821. On November 28, 1821, Panama became independent and voluntarily joined Bolívar\'s dream by signing a non-aggression pact with Spain.\r\n\r\nSpain\'s resistance on the continent ended in Peru with the battle of Ayacucho, on December 9, 1824, in which Antonio José de Sucre (1795-1830) was definitively consecrated as a hero. All Spanish power in the Viceroyalty of New Granada and in Peru was sunk under the blows of three men: Bolívar, Miranda and Sucre; deceased in different circumstances: Bolívar on December 17, 1830, in Santa Marta, Colombia; Francisco de Miranda in the Carraca prison, in Cádiz, in 1816; Antonio José de Sucre, assassinated in Berruecos, Nueva Granada (now Colombia), on June 4, 1830.\r\n\r\nHowever, the political union of the territories of the former Viceroyalties of New Granada, Quito and the Captaincy of Venezuela did not last due to regional tensions. Opponents of the Bolívar government came to consider the secessionist option. In 1830 Venezuela and Ecuador declared their independence from the Republic of Colombia, finally dissolving Gran Colombia in 1831, giving birth to three different state entities: New Granada, Ecuador and Venezuela. The Venezuelan secession was led by General José Antonio Páez (1790-1875), who had already fought under the orders of Bolívar and since then had virtual control of the Venezuelan part of the republic. Páez became the first president of the new Venezuelan state and ruled intermittently until 1863. In Ecuador, the Venezuelan general Juan José Flores took office. Reduced to New Granada, presided over by Rafael Urdaneta, who had originally carried out a coup thinking of returning Bolívar to power, Gran Colombia dissolved after Urdaneta\'s overthrow. In New Granada, after a time when a new structure and laws were given during a provisional government, José María Obando was elected interim vice president. A year later, Francisco de Paula Santander took office as president and outlined the structure of the new State.\r\n\r\nIn Venezuela, a group of patriotic officers rose up in 1835 against President José María Vargas, in what is known as the Reform Revolution, to demand the reconstitution of Gran Colombia, political reforms and the end of the economic power of the oligarchy. , strengthened with import and export trade. They obtained an ephemeral triumph, but then General José Antonio Páez resumed power, thus making the dissolution of Gran Colombia final.', 2, 1, 0, 1, 7),
(11, 'Dissolution', 'From 1830 in the middle of the separations of Ecuador (1830), Panama (1830 and 1831) and Venezuela (1830); the disintegration of Gran Colombia and its political structures was precipitated. Being born as a consequence the State of Ecuador and the State of Venezuela; Panama remained under dictatorial military governments that failed to organize the basic institutions of a State; while in the central departments of Gran Colombia, the discontent of the military and of the liberal groups was accentuated and led to the dictatorship of General Rafael Urdaneta (September 5, 1830 to May 3, 1831). Finally, in December 1830, Simón Bolívar died.\r\n\r\nThrough the Agreement of Apulo (carried out on April 28, 1831), General Rafael Urdaneta, hands over command of the dismembered Gran Colombia to Domingo Caicedo (May 3, 1831). He presided over it until November 21, 1831 when it was legally abolished.\r\n\r\nOn May 7, 1831, a convention was called to the central departments of the deceased Gran Colombia, in which representatives of Cundinamarca, Cauca, Antioquia, Isthmus (Panama), Magdalena and Boyacá were to gather. They were to meet in Bogotá on October 15. Panama joined the initiative after the fall of the dictatorial regime at the end of August 1831.\r\n\r\nThe objective of this convention was to agree on a new form of political organization for the central departments of the deceased Gran Colombia and to elect the magistrates that were to govern it.\r\n\r\nIn the convention finally held on October 20, 1831, the State of New Granada was created, which with the Constitution of 1832 would be officially called the Republic of New Granada, with Francisco de Paula Santander being its first president.', 3, 1, 0, 1, 7),
(12, 'Presidents', 'Simón Bolívar (1819-1830)#;Francisco de Paula Santander (1819-1827)#;Domingo Caycedo (1830)#;Joaquín Mosquera (1830)#;Rafael Urdaneta (1830-1831)#;Domingo Caycedo (1831)', 4, 1, 0, 4, 7),
(13, 'Childhood', 'Francisco de Miranda\'s origins were relatively humble. His father, Sebastián de Miranda Ravelo, was born on September 12, 1721 in Puerto de la Cruz,45 a town in the La Orotava valley, in Tenerife (Canary Islands). He was baptized in the parish of Nuestra Señora de la Peña ten days later. He was the son of Gabriel de Miranda, also born in Puerto de la Cruz on November 6, 1686, and María de la Concepción Ravelo de León, daughter of Domingo de Sosa de León and Catalina Ravelo.\r\n\r\nSebastián de Miranda, for reasons of birth, when he was suspected of being a Guanche mestizo, belonged to the social category of shore whites, considered inferior to Spanish whites and Creoles. It is known that the Cabildo de Caracas accused him of \"mulatto, merchant, adventurer and unworthy due to many records of holding a high-ranking position.\" It is not surprising that, having reached a certain financial comfort, he tried to prove in court that his origins were \"pure\" in order to obtain greater social privileges. In an alternative hypothesis to that of his Guanche origin, José Chocrón Cohen has pointed out that, according to his research, Sebastián de Miranda was rejected because of his possible Jewish origin and his status as a converted pig. The Canary Islands were an important settlement for Jews who fled from other regions of Spain. Finally, Sebastián de Miranda settled in Venezuela. 6 At that time, it was more difficult for the Jew to change his profession than his homeland and surname. The economic activity of the Miranda family was related to the Jewish people and not to the Catholics. According to this hypothesis, although Miranda was not Jewish, at least there were reasons to believe that he was a descendant of Jews.\r\n\r\nIn Caracas, Sebastián de Miranda Ravelo, father of Francisco de Miranda, established himself as a linen merchant (an economic activity related to the Crypto-Jews) and, over time, married on April 24, 1749 in the Cathedral Church with the woman from Caracas. Francisca Antonia Rodríguez de Espinosa (possibly of Jewish-Jewish origin), also of Canarian origin and necessarily white; otherwise, the wedding would not have appeared in the marriage registry and their children would never have been able to go to university. The eldest of ten sons and daughters of the couple, Sebastián Francisco de Miranda, was born on March 28, 1750 in Caracas. His siblings were Ana Antonia, Rosa Agustina, Micaela Antonia, Miguel Francisco, Javier, Francisco Antonio, Ignacio José, Josefa María and Josefa Antonia.', 1, 1, 0, 1, 8),
(14, 'Imprisonment', 'The signing of the capitulation would generate confusion and would be interpreted as a betrayal, so before embarking in the port of La Guaira and heading abroad to continue the fight, a group of officers led by Bolívar arrested Miranda, and Colonel José Mires locked him up in Fort San Carlos on July 31. Apparently, Bolívar\'s intention was to shoot him for considering that the San Mateo pact was an act of treason, but finally, following various advice, Miranda was imprisoned under Colonel Manuel María de las Casas, military commander of the port, who in He secretly went over to the Spanish side, handing Miranda over to Domingo de Monteverde, along with the other refugees who had not been able to set sail (Simón Bolívar was unaware of the betrayal of Manuel María de las Casas, and he then headed for Caracas, already in the hands of the royalists, where thanks to the intercession of some friends on the enemy side, he obtained a passport from Domingo de Monteverde, who is said to have expressed verbatim \"The request of Colonel Bolívar must be satisfied, as a reward for the service rendered to the King of Spain with the delivery of Miranda\", some time after leaving Venezuela, Bolívar would return to restart the war).', 2, 1, 0, 2, 8),
(15, 'Prison and death', 'From the port of La Guaira, Miranda was transferred to the San Carlos de Caracas barracks and from there to the San Felipe de Puerto Cabello castle, where at the beginning of 1813 he wrote a memorial from his cell to the Royal Court of Caracas demanding compliance with the capitulation. of San Mateo. On June 4, 1813, he was transferred to the San Felipe del Morro Castle, located in Puerto Rico, and from there to Spain, where he was locked up in a tall and spacious cell in the Cuatro Torres prison in the Carraca arsenal, in San Fernando. Here he only received little news and help from some friends. Miranda plans to escape to Gibraltar, but a stroke thwarts his plans and he dies, aged 66, on July 14, 1816.\r\n\r\nAn oil painting by the Venezuelan artist Arturo Michelena, entitled Miranda en la Carraca (1896) —which portrays the hero in the Spanish jail where he died—, has become a graphic symbol of Venezuelan history and has immortalized the image of Miranda for successive generations of Venezuelans. As an additional note, it is important to say that Miranda is also considered one of the founding fathers of Freemasonry in Latin America. In Venezuela, different avenues, streets, squares, highways and parks are honored with the name of Miranda. Likewise, the third most populous entity in the country, after Zulia and Caracas, Miranda state, bears his name.\r\n\r\nWithin the framework of his dedication to the independence of the continent, Miranda used a lot of energy to prepare, publish and disseminate documents of a different nature: letters, proclamations, plans, projects, articles, essays, etc. Much of this material involved a cultural, ideological, and political transfer through translation. In addition to translating from Latin and Greek, Miranda was fluent in several modern languages ​​(German, Spanish, French, English, and Italian), knew Latin and Greek, and even wrote using several languages. His intellectual activity covered the most diverse topics apart from the political, philosophical and military. He was the first Hispanic American to request the granting of political rights to women on October 26, 1792, a few months after the publication of the Déclaration des droits de la femme et de la citoyenne (1791) by Olympe de Gouges.\r\n\r\nHis son Leandro de Miranda was director of the first bank in Venezuela, albeit with foreign capital, called the British Colonial Bank, which operated from 1839 to 1848.', 3, 1, 0, 3, 8),
(16, 'Unrest', 'The riots began in Guarenas (a city located 25 km east of Caracas), initially in the form of protests, on the morning of February 27, 1989 when there began to be transportation problems to the capital, Caracas. At first it seemed like a protest by users against the rise in the price of transport and by carriers because that increase seemed low to them. With astonishing speed, what began as a localized protest in a small town morphed in a matter of hours into a nationwide wave of vandalism, violence and looting. The television channels broadcast the events live, at first in the popular sectors there were peaceful protests. There are even videos in which the metropolitan police are seen trying to bring order to the looting to avoid violence.\r\n\r\nIn the afternoon, there were problems in almost all the popular neighborhoods and urbanizations of Caracas, the shops had closed and public transport did not provide service.\r\n\r\nIn the following days, the media showed images that allowed us to see the magnitude of the looting. For many months it was discussed how something so violent could happen in Venezuela. It seemed that it had been a provoked movement.\r\n\r\nAccording to General Carlos Peñaloza, in his book \"El Delfin de Fidel\", Cuban agents could have entered Venezuela during the inauguration ceremony of Carlos Andrés Pérez, which Fidel Castro attended, and they could have expected instability to occur in Venezuela to exacerbate political tensions.\r\n\r\nViolent protests also originated in other cities such as La Guaira, San Cristóbal, Maracay, Valencia, Barquisimeto, Mérida and Ciudad Guayana.', 1, 1, 0, 3, 10),
(17, 'Consecuences', 'The Caracazo was one of the consequences and aggravating factors of the political instability that Venezuela had experienced since the beginning of the economic and institutional crisis. The government program was modified after the events; Carlos Andres Pérez convened a Consultative Council in which the opposition was also present, in an attempt to redirect the social situation in Venezuela. On March 7, the liberation of prices is decreed. The decentralization process is accelerated with the first direct election of Governors and Mayors held in December 1989, which allows a democratic respite.\r\n\r\nThe climate of popular discontent aggravated by the Caracazo was followed in 1992 by two attempted coups: one in February and the other in November. It was a conspiratorial lodge that had been operating in the army since 1982 and had already had a coup attempt, also frustrated in October 1988. The growing disapproval of President Pérez\'s management, the break with the Acción Democrática party, the lack of of new leaderships, the corruption of the political class and the traditional bipartisanship, together with the package of measures applied, made the moment propitious for the coup attempts that President Pérez managed to thwart.\r\n\r\nIn March 1993, President Carlos Andrés Pérez was officially accused of corruption and removed from office, assuming the presidency by designation of the National Congress (Current National Assembly) Ramón J. Velásquez, who was succeeded by Rafael Caldera after the 1993 elections. Lieutenant Colonel Hugo Chávez, one of the leaders of the first coup attempt in 1992, is found guilty of directing the military rebellion, being imprisoned and later dismissed by President Rafael Caldera. Restored to his political rights, the colonel would later appear in the 1998 elections and win them. relying on the discontent and frustration of the Venezuelans of the moment.\r\n\r\nThe Inter-American Court of Human Rights condemned the government\'s actions. The State promised to compensate the victims, a fact that was partially fulfilled in 2004 with those victims represented by the human rights organization Cofavic.\r\n\r\nHowever, at the end of 2006 the government of President Hugo Chávez, through the Ministry of the Interior and Justice, announced mechanisms to also compensate victims who did not have access to the Inter-American Court. In 2005 it was released in Venezuelan cinemas \" El Caracazo\", a film directed by Román Chalbaud, whose plot is based on the events of the same.', 2, 1, 0, 2, 10),
(18, 'Important participants', 'Carlos Andrés Pérez, President of Venezuela for Democratic Action (February 1989 - May 1993), Commander in Chief of the Armed Forces, ruler during the events.#;\r\nDivision Gen. (Ex) Italo del Valle Alliegro, Minister of Defense. Cited as Defendant by the Public Ministry for June 22, 2009.#;\r\nDivision Gen. (Ex) José María Troconis Peraza Commander of the Army (June 1988 - June 1989)#;\r\nAlejandro Izaguirre Angeli, Minister of Interior Relations.#;\r\nVirgilio Ávila Vivas, Governor of the Federal District (February 2, 1989 - January 1992) appointed by President Pérez.#;\r\nGen. Manuel Antonio Gil, Army Strategic Command#;\r\nGen. Manuel Heinz Azpúrua, at the time of the events, was Chief of the Army\'s Strategic Command, later he was Director of the Directorate of Intelligence and Prevention Services (Disip). Charged by the Public Ministry in June 2009.#;\r\nGen. (GN) Freddy Maya Cardona, Commander of Regional 5 of the National Guard.#;\r\nReinaldo Figueredo Planchart, Minister of the Secretariat of the Presidency.#;\r\nGen. Humberto Rumbos, head of the Military House.#;\r\nElderly. Felipe Acosta Carlés, a member of the MBR 200 military lodge, died in El Valle while leading the repression in that area of ​​Caracas.#;\r\nMiguel Rodríguez Fandeo, Minister of Cordiplan (Central Office for Coordination and Planning of the Presidency), responsible for economic planning.#;', 3, 1, 0, 5, 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `articles_sectiontype`
--

CREATE TABLE `articles_sectiontype` (
  `id` bigint(20) NOT NULL,
  `name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `articles_sectiontype`
--

INSERT INTO `articles_sectiontype` (`id`, `name`) VALUES
(4, 'Ordened list'),
(1, 'Pure text'),
(2, 'Text with L image'),
(3, 'Text with R image'),
(5, 'Unordened list');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `articles_section_images`
--

CREATE TABLE `articles_section_images` (
  `id` bigint(20) NOT NULL,
  `section_id` bigint(20) NOT NULL,
  `image_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `articles_section_images`
--

INSERT INTO `articles_section_images` (`id`, `section_id`, `image_id`) VALUES
(2, 6, 15),
(3, 7, 16),
(4, 14, 20),
(5, 15, 21),
(6, 16, 27),
(7, 16, 28),
(8, 17, 29);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `articles_summary`
--

CREATE TABLE `articles_summary` (
  `id` bigint(20) NOT NULL,
  `content` longtext DEFAULT NULL,
  `title` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `articles_summary`
--

INSERT INTO `articles_summary` (`id`, `content`, `title`) VALUES
(6, 'Full name:Simón José Antonio de la Santísima Trinidad Bolívar Ponte y Palacios Blanco; Birthdate:1783/6/24;Dead:1830/12/17;Dead cause:Tuberculosis and typhoid fever;Nationality: Spanish, Venezuelan, Colombian, Mexican;language:spanish;ocupation:millitar and poliical', 'Simón Bolívar'),
(7, 'Capital:Bogotá;Entity:Disbanded republic;Languaje:Spanish;surface:2172609Km and 2519954Km;Population:2469000;Current countries:Colombia, Ecuador, Panamá, Venezuela, Guayana Esequiba;Founder:Simón Bolívar', 'Gran Colombia'),
(8, 'Full name:Sebastián Francisco de Miranda y Rodríguez Espinoza;Nickname:El Precursor, El Fran Americano Universal;Birthdate:1750/3/28;Death:1816/7/14;Nationality:Venezuelan, Spanish;Language:Spanish;Ocupation:Militar, politic, writter, humanist, diplomatic', 'Francisco de Miranda'),
(9, 'Capital:Puerto España;Language:English;Surface:5128Km^2;Population:1363985', 'Trinidad and Tobago'),
(10, 'Date:1989/2/27;Duration:9 days;Place:Venezuela;Deads:276', 'Caracazo'),
(11, '<', 'uwu');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add Article', 7, 'add_article'),
(26, 'Can change Article', 7, 'change_article'),
(27, 'Can delete Article', 7, 'delete_article'),
(28, 'Can view Article', 7, 'view_article'),
(29, 'Can add Article category', 8, 'add_category'),
(30, 'Can change Article category', 8, 'change_category'),
(31, 'Can delete Article category', 8, 'delete_category'),
(32, 'Can view Article category', 8, 'view_category'),
(33, 'Can add Article image', 9, 'add_image'),
(34, 'Can change Article image', 9, 'change_image'),
(35, 'Can delete Article image', 9, 'delete_image'),
(36, 'Can view Article image', 9, 'view_image'),
(37, 'Can add Section type', 10, 'add_sectiontype'),
(38, 'Can change Section type', 10, 'change_sectiontype'),
(39, 'Can delete Section type', 10, 'delete_sectiontype'),
(40, 'Can view Section type', 10, 'view_sectiontype'),
(41, 'Can add Article summary', 11, 'add_summary'),
(42, 'Can change Article summary', 11, 'change_summary'),
(43, 'Can delete Article summary', 11, 'delete_summary'),
(44, 'Can view Article summary', 11, 'view_summary'),
(45, 'Can add Article section', 12, 'add_section'),
(46, 'Can change Article section', 12, 'change_section'),
(47, 'Can delete Article section', 12, 'delete_section'),
(48, 'Can view Article section', 12, 'view_section'),
(49, 'Can add Related articles', 13, 'add_relatedarticles'),
(50, 'Can change Related articles', 13, 'change_relatedarticles'),
(51, 'Can delete Related articles', 13, 'delete_relatedarticles'),
(52, 'Can view Related articles', 13, 'view_relatedarticles'),
(53, 'Can add contact', 14, 'add_contact'),
(54, 'Can change contact', 14, 'change_contact'),
(55, 'Can delete contact', 14, 'delete_contact'),
(56, 'Can view contact', 14, 'view_contact'),
(57, 'Can add Comment', 15, 'add_comment'),
(58, 'Can change Comment', 15, 'change_comment'),
(59, 'Can delete Comment', 15, 'delete_comment'),
(60, 'Can view Comment', 15, 'view_comment'),
(61, 'Can add author', 16, 'add_author'),
(62, 'Can change author', 16, 'change_author'),
(63, 'Can delete author', 16, 'delete_author'),
(64, 'Can view author', 16, 'view_author'),
(65, 'Can add Favourite articles', 17, 'add_favouritearticles'),
(66, 'Can change Favourite articles', 17, 'change_favouritearticles'),
(67, 'Can delete Favourite articles', 17, 'delete_favouritearticles'),
(68, 'Can view Favourite articles', 17, 'view_favouritearticles');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$390000$3CVRflDnrshgMq0Q5W74de$OvBVVV/for2wyXJjK6w7kpsFeG8Uadus+6avXhhDpzk=', '2023-04-10 20:28:27.126387', 1, 'atlantox', '', '', 'atlantox7@gmail.com', 1, 1, '2023-02-27 16:35:51.076947');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comments_author`
--

CREATE TABLE `comments_author` (
  `id` bigint(20) NOT NULL,
  `nickname` varchar(20) NOT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `comments_author`
--

INSERT INTO `comments_author` (`id`, `nickname`, `user_id`) VALUES
(1, 'Atlantox7', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comments_comment`
--

CREATE TABLE `comments_comment` (
  `id` bigint(20) NOT NULL,
  `content` varchar(200) NOT NULL,
  `created` datetime(6) NOT NULL,
  `article_id` bigint(20) NOT NULL,
  `author_id` bigint(20) DEFAULT NULL,
  `bloqued` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `comments_comment`
--

INSERT INTO `comments_comment` (`id`, `content`, `created`, `article_id`, `author_id`, `bloqued`) VALUES
(37, 'Horrible...', '2023-03-27 20:46:00.606954', 10, 1, 0),
(38, 'Que hermosa es la pintura de Miranda en la carraca', '2023-03-27 20:46:24.989346', 8, 1, 0),
(39, 'Big Colombia, my home', '2023-04-04 16:08:38.258258', 7, 1, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comments_favouritearticles`
--

CREATE TABLE `comments_favouritearticles` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `comments_favouritearticles`
--

INSERT INTO `comments_favouritearticles` (`id`, `user_id`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comments_favouritearticles_articles`
--

CREATE TABLE `comments_favouritearticles_articles` (
  `id` bigint(20) NOT NULL,
  `favouritearticles_id` bigint(20) NOT NULL,
  `article_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2023-02-27 16:36:21.060478', '1', 'Characters', 1, '[{\"added\": {}}]', 8, 1),
(2, '2023-02-27 16:36:27.604574', '2', 'Places', 1, '[{\"added\": {}}]', 8, 1),
(3, '2023-02-27 16:36:56.864480', '3', 'Heroes', 1, '[{\"added\": {}}]', 8, 1),
(4, '2023-02-27 16:37:28.542258', '4', 'Festivities', 1, '[{\"added\": {}}]', 8, 1),
(5, '2023-02-27 16:37:32.660210', '5', 'Races', 1, '[{\"added\": {}}]', 8, 1),
(6, '2023-02-27 16:37:47.568155', '1', 'Pure text', 1, '[{\"added\": {}}]', 10, 1),
(7, '2023-02-27 16:37:50.796711', '2', 'Text with L image', 1, '[{\"added\": {}}]', 10, 1),
(8, '2023-02-27 16:37:53.404116', '3', 'Text with R image', 1, '[{\"added\": {}}]', 10, 1),
(9, '2023-02-27 16:37:57.052088', '4', 'Ordened list', 1, '[{\"added\": {}}]', 10, 1),
(10, '2023-02-27 16:38:00.542972', '5', 'Unordened list', 1, '[{\"added\": {}}]', 10, 1),
(11, '2023-02-27 16:38:46.274750', '1', 'Stefannie', 1, '[{\"added\": {}}]', 9, 1),
(12, '2023-02-27 16:39:12.481701', '2', 'Ámber', 1, '[{\"added\": {}}]', 9, 1),
(13, '2023-02-27 16:39:23.482771', '3', 'Liz\'Amar', 1, '[{\"added\": {}}]', 9, 1),
(14, '2023-02-27 16:47:00.540900', '1', 'Stefannie Kyoi', 1, '[{\"added\": {}}]', 7, 1),
(15, '2023-02-27 16:50:46.197720', '4', 'Dark elves', 1, '[{\"added\": {}}]', 9, 1),
(16, '2023-02-27 17:04:58.161273', '2', 'Dark elfs', 1, '[{\"added\": {}}]', 7, 1),
(17, '2023-02-27 17:05:07.997732', '2', 'Dark elves', 2, '[{\"changed\": {\"fields\": [\"Title\"]}}]', 7, 1),
(18, '2023-03-05 21:06:12.838878', '1', 'Stefannie Kyoi\'s summary', 1, '[{\"added\": {}}]', 11, 1),
(19, '2023-03-05 21:19:49.615538', '1', 'Stefannie Kyoi\'s summary', 2, '[{\"changed\": {\"fields\": [\"Article\'s summary content\"]}}]', 11, 1),
(20, '2023-03-05 21:20:18.912431', '1', 'Stefannie Kyoi\'s summary', 2, '[{\"changed\": {\"fields\": [\"Article\'s summary content\"]}}]', 11, 1),
(21, '2023-03-05 21:21:05.352309', '1', 'Stefannie Kyoi\'s summary', 2, '[{\"changed\": {\"fields\": [\"Article\'s summary content\"]}}]', 11, 1),
(22, '2023-03-05 21:24:04.833771', '1', 'Stefannie Kyoi\'s summary', 2, '[{\"changed\": {\"fields\": [\"Article\'s summary content\"]}}]', 11, 1),
(23, '2023-03-05 22:00:46.626950', '1', 'Stefannie Kyoi', 1, '[{\"added\": {}}]', 13, 1),
(24, '2023-03-05 22:10:06.260339', '2', 'Dark elves\'s summary', 1, '[{\"added\": {}}]', 11, 1),
(25, '2023-03-05 22:10:57.061201', '2', 'Dark elves', 1, '[{\"added\": {}}]', 13, 1),
(26, '2023-03-05 22:24:43.032589', '1', 'Personality: Stefannie Kyoi', 1, '[{\"added\": {}}]', 12, 1),
(27, '2023-03-06 21:58:26.007968', '5', 'Stealth Stefannie', 1, '[{\"added\": {}}]', 9, 1),
(28, '2023-03-06 21:58:39.614085', '1', 'Stefannie Kyoi', 2, '[{\"changed\": {\"fields\": [\"Article main image(s)\"]}}]', 7, 1),
(29, '2023-03-07 13:38:49.598877', '2', 'Death: Stefannie Kyoi', 1, '[{\"added\": {}}]', 12, 1),
(30, '2023-03-07 14:48:36.326070', '6', 'Places', 1, '[{\"added\": {}}]', 9, 1),
(31, '2023-03-07 14:48:54.002799', '7', 'Characters category', 1, '[{\"added\": {}}]', 9, 1),
(32, '2023-03-07 14:49:15.425936', '8', 'Festivities category', 1, '[{\"added\": {}}]', 9, 1),
(33, '2023-03-07 14:49:25.600143', '9', 'Races categories', 1, '[{\"added\": {}}]', 9, 1),
(34, '2023-03-07 14:49:40.557517', '10', 'Heroes category', 1, '[{\"added\": {}}]', 9, 1),
(35, '2023-03-07 14:49:55.127260', '6', 'Places category', 2, '[{\"changed\": {\"fields\": [\"Image title\"]}}]', 9, 1),
(36, '2023-03-07 14:50:31.923204', '5', 'Races', 2, '[{\"changed\": {\"fields\": [\"Category image\"]}}]', 8, 1),
(37, '2023-03-07 14:50:41.257249', '4', 'Festivities', 2, '[{\"changed\": {\"fields\": [\"Category image\"]}}]', 8, 1),
(38, '2023-03-07 14:50:46.503121', '3', 'Heroes', 2, '[{\"changed\": {\"fields\": [\"Category image\"]}}]', 8, 1),
(39, '2023-03-07 14:50:56.290403', '2', 'Places', 2, '[{\"changed\": {\"fields\": [\"Category image\"]}}]', 8, 1),
(40, '2023-03-07 14:51:03.182086', '1', 'Characters', 2, '[{\"changed\": {\"fields\": [\"Category image\"]}}]', 8, 1),
(41, '2023-03-10 16:13:13.394311', '11', 'Stealth instructor', 1, '[{\"added\": {}}]', 9, 1),
(42, '2023-03-10 16:13:23.145406', '3', 'Family: Stefannie Kyoi', 1, '[{\"added\": {}}]', 12, 1),
(43, '2023-03-10 16:34:43.270604', '3', 'Family: Stefannie Kyoi', 2, '[{\"changed\": {\"fields\": [\"Section type\"]}}]', 12, 1),
(44, '2023-03-10 16:34:59.944508', '3', 'Family: Stefannie Kyoi', 2, '[{\"changed\": {\"fields\": [\"Is collapse\"]}}]', 12, 1),
(45, '2023-03-10 16:36:04.045039', '3', 'Family: Stefannie Kyoi', 2, '[{\"changed\": {\"fields\": [\"Is visible\"]}}]', 12, 1),
(46, '2023-03-10 16:36:17.398700', '3', 'Family: Stefannie Kyoi', 2, '[{\"changed\": {\"fields\": [\"Is visible\", \"Is collapse\"]}}]', 12, 1),
(47, '2023-03-10 17:01:59.815024', '4', 'Disgusts: Stefannie Kyoi', 1, '[{\"added\": {}}]', 12, 1),
(48, '2023-03-10 17:03:43.492225', '4', 'Disgusts: Stefannie Kyoi', 2, '[{\"changed\": {\"fields\": [\"Show order\"]}}]', 12, 1),
(49, '2023-03-10 18:43:58.075559', '4', 'Disgusts: Stefannie Kyoi', 2, '[{\"changed\": {\"fields\": [\"Is collapse\"]}}]', 12, 1),
(50, '2023-03-10 18:45:08.991830', '4', 'Disgusts: Stefannie Kyoi', 2, '[{\"changed\": {\"fields\": [\"Is collapse\"]}}]', 12, 1),
(51, '2023-03-10 18:45:39.054272', '4', 'Disgusts: Stefannie Kyoi', 2, '[{\"changed\": {\"fields\": [\"Is collapse\"]}}]', 12, 1),
(52, '2023-03-10 18:46:31.234449', '4', 'Disgusts: Stefannie Kyoi', 2, '[{\"changed\": {\"fields\": [\"Section type\"]}}]', 12, 1),
(53, '2023-03-10 18:48:05.491117', '2', 'Dark elves', 2, '[{\"changed\": {\"fields\": [\"Other names\"]}}]', 7, 1),
(54, '2023-03-10 19:03:47.658707', '1', 'Stefannie Kyoi', 2, '[{\"changed\": {\"fields\": [\"Other names\"]}}]', 7, 1),
(55, '2023-03-10 19:03:58.949325', '1', 'Stefannie Kyoi', 2, '[{\"changed\": {\"fields\": [\"Other names\"]}}]', 7, 1),
(56, '2023-03-10 20:26:37.428241', '3', 'Stealth Instructor', 1, '[{\"added\": {}}]', 7, 1),
(57, '2023-03-10 20:27:50.545323', '3', 'Stealth Instructor\'s summary', 1, '[{\"added\": {}}]', 11, 1),
(58, '2023-03-10 20:32:00.361654', '3', 'Stealth Instructor\'s summary', 2, '[{\"changed\": {\"fields\": [\"Article\'s summary content\"]}}]', 11, 1),
(59, '2023-03-10 20:43:15.212630', '3', 'Stealth Instructor', 1, '[{\"added\": {}}]', 13, 1),
(60, '2023-03-10 20:43:47.453380', '3', 'Stealth Instructor', 2, '[]', 13, 1),
(61, '2023-03-13 15:00:47.745862', '3', 'Stealth Instructor\'s summary', 2, '[{\"changed\": {\"fields\": [\"Article\'s summary content\"]}}]', 11, 1),
(62, '2023-03-13 15:01:20.697256', '3', 'Stealth Instructor\'s summary', 2, '[{\"changed\": {\"fields\": [\"Article\'s summary content\"]}}]', 11, 1),
(63, '2023-03-13 15:01:33.611670', '3', 'Stealth Instructor\'s summary', 2, '[{\"changed\": {\"fields\": [\"Article\'s summary content\"]}}]', 11, 1),
(64, '2023-03-13 16:01:52.391328', '3', 'Stealth Instructor\'s summary', 2, '[{\"changed\": {\"fields\": [\"Article\'s summary content\"]}}]', 11, 1),
(65, '2023-03-13 16:02:32.390805', '3', 'Stealth Instructor\'s summary', 2, '[{\"changed\": {\"fields\": [\"Article\'s summary content\"]}}]', 11, 1),
(66, '2023-03-13 16:02:54.213926', '3', 'Stealth Instructor\'s summary', 2, '[{\"changed\": {\"fields\": [\"Article\'s summary content\"]}}]', 11, 1),
(67, '2023-03-13 16:15:25.518635', '3', 'Stealth Instructor\'s summary', 2, '[{\"changed\": {\"fields\": [\"Article\'s summary content\"]}}]', 11, 1),
(68, '2023-03-13 18:51:25.151902', '3', 'Stealth Instructor\'s summary', 2, '[{\"changed\": {\"fields\": [\"Article\'s summary content\"]}}]', 11, 1),
(69, '2023-03-13 19:53:11.197756', '1', 'Stefannie Kyoi\'s summary', 2, '[{\"changed\": {\"fields\": [\"Article\'s summary content\"]}}]', 11, 1),
(70, '2023-03-13 20:02:58.775383', '4', 'Liz\'Amar (Tales of Venslla)', 1, '[{\"added\": {}}]', 7, 1),
(71, '2023-03-13 20:03:41.443984', '4', 'Liz\'Amar (Tales of Venslla)\'s summary', 1, '[{\"added\": {}}]', 11, 1),
(72, '2023-03-13 20:06:12.943181', '12', 'Armored LizAmar', 1, '[{\"added\": {}}]', 9, 1),
(73, '2023-03-13 20:07:19.521932', '5', 'Liz\'Amar(War of Venslla)', 1, '[{\"added\": {}}]', 7, 1),
(74, '2023-03-13 20:07:52.858487', '5', 'Liz\'Amar(War of Venslla)\'s summary', 1, '[{\"added\": {}}]', 11, 1),
(75, '2023-03-13 20:11:11.042854', '5', 'Liz\'Amar(War of Venslla)', 2, '[{\"changed\": {\"fields\": [\"Article main image(s)\"]}}]', 7, 1),
(76, '2023-03-13 22:22:10.052966', '3', 'Family: Stefannie Kyoi', 2, '[{\"changed\": {\"fields\": [\"Section type\"]}}]', 12, 1),
(77, '2023-03-16 19:32:51.658614', '1', 'She is my favourite!', 1, '[{\"added\": {}}]', 15, 1),
(78, '2023-03-16 20:29:30.518442', '2', 'I love her!', 1, '[{\"added\": {}}]', 15, 1),
(79, '2023-03-19 15:13:13.277482', '1', 'Author object (1)', 1, '[{\"added\": {}}]', 16, 1),
(80, '2023-03-19 15:14:10.968938', '3', 'She is my favourite!', 1, '[{\"added\": {}}]', 15, 1),
(81, '2023-03-19 20:27:53.782994', '3', 'She is my favourite!', 2, '[{\"changed\": {\"fields\": [\"Content\"]}}]', 15, 1),
(82, '2023-03-19 21:31:54.020335', '4', 'I love her!', 1, '[{\"added\": {}}]', 15, 1),
(83, '2023-03-22 14:43:28.498483', '5', 'self.title', 2, '[{\"changed\": {\"fields\": [\"Title\"]}}]', 11, 1),
(84, '2023-03-22 14:43:52.493837', '4', 'self.title', 2, '[{\"changed\": {\"fields\": [\"Title\"]}}]', 11, 1),
(85, '2023-03-22 14:44:06.163807', '3', 'self.title', 2, '[{\"changed\": {\"fields\": [\"Title\"]}}]', 11, 1),
(86, '2023-03-22 14:44:19.470612', '2', 'self.title', 2, '[{\"changed\": {\"fields\": [\"Title\"]}}]', 11, 1),
(87, '2023-03-22 14:44:25.425663', '1', 'self.title', 2, '[{\"changed\": {\"fields\": [\"Title\"]}}]', 11, 1),
(88, '2023-03-22 14:44:45.693966', '5', 'Liz\'Amar(War of Venslla)', 2, '[{\"changed\": {\"fields\": [\"Summary\"]}}]', 7, 1),
(89, '2023-03-22 14:44:52.397768', '4', 'Liz\'Amar (Tales of Venslla)', 2, '[{\"changed\": {\"fields\": [\"Summary\"]}}]', 7, 1),
(90, '2023-03-22 14:44:59.117427', '3', 'Stealth Instructor', 2, '[{\"changed\": {\"fields\": [\"Summary\"]}}]', 7, 1),
(91, '2023-03-22 14:45:04.676119', '2', 'Dark elves', 2, '[{\"changed\": {\"fields\": [\"Summary\"]}}]', 7, 1),
(92, '2023-03-22 14:45:10.352820', '1', 'Stefannie Kyoi', 2, '[{\"changed\": {\"fields\": [\"Summary\"]}}]', 7, 1),
(93, '2023-03-22 15:41:30.339118', '1', 'Atlantox7', 1, '[{\"added\": {}}]', 17, 1),
(94, '2023-03-22 16:57:54.836563', '2', 'El mas capo', 1, '[{\"added\": {}}]', 17, 1),
(95, '2023-03-23 15:28:19.280729', '1', 'Stefannie Kyoi', 2, '[{\"changed\": {\"fields\": [\"Related articles\"]}}]', 13, 1),
(96, '2023-03-23 18:21:35.465867', '4', 'Liz\'Amar (War of Venslla)', 1, '[{\"added\": {}}]', 13, 1),
(97, '2023-03-23 18:21:47.993481', '5', 'Liz\'Amar (Tales of Venslla)', 1, '[{\"added\": {}}]', 13, 1),
(98, '2023-03-23 18:22:33.653853', '5', 'Liz\'Amar (War of Venslla)', 2, '[{\"changed\": {\"fields\": [\"Title\"]}}]', 7, 1),
(99, '2023-03-24 19:40:15.529977', '1', 'Stefannie Kyoi', 2, '[{\"changed\": {\"fields\": [\"Main content\"]}}]', 7, 1),
(100, '2023-03-24 19:40:39.228979', '1', 'Stefannie Kyoi', 2, '[{\"changed\": {\"fields\": [\"Main content\"]}}]', 7, 1),
(101, '2023-03-24 19:40:55.093745', '1', 'Stefannie Kyoi', 2, '[{\"changed\": {\"fields\": [\"Main content\"]}}]', 7, 1),
(102, '2023-03-24 19:43:05.517681', '1', 'Stefannie Kyoi', 2, '[{\"changed\": {\"fields\": [\"Main content\"]}}]', 7, 1),
(103, '2023-03-24 19:43:16.393039', '1', 'Stefannie Kyoi', 2, '[{\"changed\": {\"fields\": [\"Main content\"]}}]', 7, 1),
(104, '2023-03-24 19:43:28.242439', '1', 'Stefannie Kyoi', 2, '[{\"changed\": {\"fields\": [\"Main content\"]}}]', 7, 1),
(105, '2023-03-24 19:43:54.031809', '1', 'Stefannie Kyoi', 2, '[{\"changed\": {\"fields\": [\"Main content\"]}}]', 7, 1),
(106, '2023-03-24 19:44:13.828698', '1', 'Stefannie Kyoi', 2, '[{\"changed\": {\"fields\": [\"Main content\"]}}]', 7, 1),
(107, '2023-03-24 19:44:32.074838', '1', 'Stefannie Kyoi', 2, '[{\"changed\": {\"fields\": [\"Main content\"]}}]', 7, 1),
(108, '2023-03-24 19:44:45.954806', '1', 'Stefannie Kyoi', 2, '[{\"changed\": {\"fields\": [\"Main content\"]}}]', 7, 1),
(109, '2023-03-24 19:45:00.834316', '1', 'Stefannie Kyoi', 2, '[{\"changed\": {\"fields\": [\"Main content\"]}}]', 7, 1),
(110, '2023-03-26 13:33:26.834183', '1', 'Stefannie Kyoi', 2, '[{\"changed\": {\"fields\": [\"Main content\"]}}]', 7, 1),
(111, '2023-03-26 13:35:44.146128', '1', 'Stefannie Kyoi', 2, '[{\"changed\": {\"fields\": [\"Main content\"]}}]', 7, 1),
(112, '2023-03-26 13:46:51.711953', '1', 'Stefannie Kyoi', 2, '[{\"changed\": {\"fields\": [\"Main content\"]}}]', 7, 1),
(113, '2023-03-26 13:53:12.664042', '1', 'Stefannie Kyoi', 2, '[{\"changed\": {\"fields\": [\"Main content\"]}}]', 7, 1),
(114, '2023-03-26 15:04:53.224573', '1', 'Stefannie Kyoi', 2, '[{\"changed\": {\"fields\": [\"Main content\"]}}]', 7, 1),
(115, '2023-03-26 15:16:51.063885', '1', 'Stefannie Kyoi', 2, '[{\"changed\": {\"fields\": [\"Main content\"]}}]', 7, 1),
(116, '2023-03-26 15:17:14.716229', '1', 'Stefannie Kyoi', 2, '[{\"changed\": {\"fields\": [\"Main content\"]}}]', 7, 1),
(117, '2023-03-26 15:17:26.092921', '1', 'Stefannie Kyoi', 2, '[{\"changed\": {\"fields\": [\"Main content\"]}}]', 7, 1),
(118, '2023-03-26 15:17:43.475333', '1', 'Stefannie Kyoi', 2, '[{\"changed\": {\"fields\": [\"Main content\"]}}]', 7, 1),
(119, '2023-03-27 18:42:08.801905', '5', 'Liz\'Amar (War of Venslla)', 3, '', 7, 1),
(120, '2023-03-27 18:42:14.195916', '4', 'Liz\'Amar (Tales of Venslla)', 3, '', 7, 1),
(121, '2023-03-27 18:42:18.419651', '3', 'Stealth Instructor', 3, '', 7, 1),
(122, '2023-03-27 18:42:22.508733', '2', 'Dark elves', 3, '', 7, 1),
(123, '2023-03-27 18:42:29.199755', '1', 'Stefannie Kyoi', 3, '', 7, 1),
(124, '2023-03-27 18:42:42.173803', '5', 'Races', 3, '', 8, 1),
(125, '2023-03-27 18:42:50.923364', '4', 'Festivities', 3, '', 8, 1),
(126, '2023-03-27 18:42:51.018947', '3', 'Heroes', 3, '', 8, 1),
(127, '2023-03-27 18:42:51.027817', '2', 'Places', 3, '', 8, 1),
(128, '2023-03-27 18:42:51.035647', '1', 'Characters', 3, '', 8, 1),
(129, '2023-03-27 18:42:58.368121', '12', 'Armored LizAmar', 3, '', 9, 1),
(130, '2023-03-27 18:42:58.401101', '11', 'Stealth instructor', 3, '', 9, 1),
(131, '2023-03-27 18:42:58.450695', '10', 'Heroes category', 3, '', 9, 1),
(132, '2023-03-27 18:42:58.525295', '9', 'Races categories', 3, '', 9, 1),
(133, '2023-03-27 18:42:58.533667', '8', 'Festivities category', 3, '', 9, 1),
(134, '2023-03-27 18:42:58.566926', '7', 'Characters category', 3, '', 9, 1),
(135, '2023-03-27 18:42:58.607677', '6', 'Places category', 3, '', 9, 1),
(136, '2023-03-27 18:42:58.641337', '5', 'Stealth Stefannie', 3, '', 9, 1),
(137, '2023-03-27 18:42:58.649341', '4', 'Dark elves', 3, '', 9, 1),
(138, '2023-03-27 18:42:58.698559', '3', 'Liz\'Amar', 3, '', 9, 1),
(139, '2023-03-27 18:42:58.707278', '2', 'Ámber', 3, '', 9, 1),
(140, '2023-03-27 18:42:58.715247', '1', 'Stefannie', 3, '', 9, 1),
(141, '2023-03-27 18:43:08.451211', '5', 'Liz\'Amar (War of Venslla)', 3, '', 11, 1),
(142, '2023-03-27 18:43:08.468565', '4', 'Liz\'Amar (Tales of Venslla)', 3, '', 11, 1),
(143, '2023-03-27 18:43:08.476967', '3', 'Stealth instructor', 3, '', 11, 1),
(144, '2023-03-27 18:43:08.485279', '2', 'Dark elves', 3, '', 11, 1),
(145, '2023-03-27 18:43:08.518335', '1', 'Stefannie Kyoi', 3, '', 11, 1),
(146, '2023-03-27 18:43:14.442445', '5', 'Liz\'Amar (Tales of Venslla)', 3, '', 13, 1),
(147, '2023-03-27 18:43:14.457380', '4', 'Liz\'Amar (War of Venslla)', 3, '', 13, 1),
(148, '2023-03-27 18:43:14.474169', '3', 'Stealth Instructor', 3, '', 13, 1),
(149, '2023-03-27 18:43:14.506832', '2', 'Dark elves', 3, '', 13, 1),
(150, '2023-03-27 18:43:14.540403', '1', 'Stefannie Kyoi', 3, '', 13, 1),
(151, '2023-03-27 18:43:45.763340', '4', 'El pepe', 3, '', 16, 1),
(152, '2023-03-27 18:43:45.798198', '3', 'Romulito', 3, '', 16, 1),
(153, '2023-03-27 18:43:45.897221', '2', 'El mas capo', 3, '', 16, 1),
(154, '2023-03-27 18:44:04.681751', '5', 'El_pepe', 3, '', 4, 1),
(155, '2023-03-27 18:44:04.756362', '3', 'PepitoGaming', 3, '', 4, 1),
(156, '2023-03-27 18:44:04.781338', '4', 'Romulo', 3, '', 4, 1),
(157, '2023-03-27 18:46:33.049168', '13', 'Simon_Bolivar', 1, '[{\"added\": {}}]', 9, 1),
(158, '2023-03-27 18:51:58.042236', '6', 'Simón Bolívar', 1, '[{\"added\": {}}]', 11, 1),
(159, '2023-03-27 18:52:42.957943', '14', 'Heroes', 1, '[{\"added\": {}}]', 9, 1),
(160, '2023-03-27 18:52:50.287396', '6', 'Heroes', 1, '[{\"added\": {}}]', 8, 1),
(161, '2023-03-27 18:54:49.487845', '6', 'Simón Bolívar', 1, '[{\"added\": {}}]', 7, 1),
(162, '2023-03-27 18:56:29.071209', '5', 'Biography: Simón Bolívar', 1, '[{\"added\": {}}]', 12, 1),
(163, '2023-03-27 18:59:13.349582', '15', 'Simon Bolivar 17 years old', 1, '[{\"added\": {}}]', 9, 1),
(164, '2023-03-27 18:59:16.043100', '6', 'Education: Simón Bolívar', 1, '[{\"added\": {}}]', 12, 1),
(165, '2023-03-27 19:02:07.915001', '16', 'Diplomatic Bolivar', 1, '[{\"added\": {}}]', 9, 1),
(166, '2023-03-27 19:02:13.702569', '7', 'Political and military life: Simón Bolívar', 1, '[{\"added\": {}}]', 12, 1),
(167, '2023-03-27 19:13:18.713300', '8', 'Honors: Simón Bolívar', 1, '[{\"added\": {}}]', 12, 1),
(168, '2023-03-27 19:20:51.820393', '7', 'Gran Colombi', 1, '[{\"added\": {}}]', 11, 1),
(169, '2023-03-27 19:21:31.221457', '17', 'Places', 1, '[{\"added\": {}}]', 9, 1),
(170, '2023-03-27 19:21:34.453591', '7', 'Places', 1, '[{\"added\": {}}]', 8, 1),
(171, '2023-03-27 19:29:22.986232', '18', 'Gran Colombia Map', 1, '[{\"added\": {}}]', 9, 1),
(172, '2023-03-27 19:29:26.936122', '7', 'Gran Colombia', 1, '[{\"added\": {}}]', 7, 1),
(173, '2023-03-27 19:31:17.208147', '9', 'Place name: Gran Colombia', 1, '[{\"added\": {}}]', 12, 1),
(174, '2023-03-27 19:32:48.211097', '10', 'History: Gran Colombia', 1, '[{\"added\": {}}]', 12, 1),
(175, '2023-03-27 19:34:15.089862', '11', 'Dissolution: Gran Colombia', 1, '[{\"added\": {}}]', 12, 1),
(176, '2023-03-27 19:37:05.342162', '12', 'Presidents: Gran Colombia', 1, '[{\"added\": {}}]', 12, 1),
(177, '2023-03-27 19:59:28.782597', '8', 'Honors: Simón Bolívar', 2, '[{\"changed\": {\"fields\": [\"Section text. To create a list use #; as separator\"]}}]', 12, 1),
(178, '2023-03-27 20:00:40.807570', '7', 'Gran Colombia', 2, '[{\"changed\": {\"fields\": [\"Title\", \"Summary\'s content. Follow this format: name1:value1;name2:value2 \\n\\n Place #C before any name to set it as censored: #Cstatus:alive\"]}}]', 11, 1),
(179, '2023-03-27 20:07:22.228467', '19', 'Francisco de Miranda', 1, '[{\"added\": {}}]', 9, 1),
(180, '2023-03-27 20:09:52.526459', '8', 'Francisco de Miranda', 1, '[{\"added\": {}}]', 11, 1),
(181, '2023-03-27 20:10:03.849117', '8', 'Francisco de Miranda', 1, '[{\"added\": {}}]', 7, 1),
(182, '2023-03-27 20:11:47.012776', '13', 'Childhood: Francisco de Miranda', 1, '[{\"added\": {}}]', 12, 1),
(183, '2023-03-27 20:16:07.301129', '20', 'Epitafio francisco de miranda', 1, '[{\"added\": {}}]', 9, 1),
(184, '2023-03-27 20:16:12.659222', '14', 'Imprisonment: Francisco de Miranda', 1, '[{\"added\": {}}]', 12, 1),
(185, '2023-03-27 20:18:32.459655', '21', 'Miranda en la carraca', 1, '[{\"added\": {}}]', 9, 1),
(186, '2023-03-27 20:18:38.033305', '15', 'Prison and death: Francisco de Miranda', 1, '[{\"added\": {}}]', 12, 1),
(187, '2023-03-27 20:20:09.495959', '22', 'Francisco with suit', 1, '[{\"added\": {}}]', 9, 1),
(188, '2023-03-27 20:20:18.662576', '8', 'Francisco de Miranda', 2, '[{\"changed\": {\"fields\": [\"Article main image(s)\"]}}]', 7, 1),
(189, '2023-03-27 20:23:39.656962', '23', 'Trinidad and Tobago\'s flag', 1, '[{\"added\": {}}]', 9, 1),
(190, '2023-03-27 20:26:13.990512', '9', 'Trinidad and Tobago', 1, '[{\"added\": {}}]', 11, 1),
(191, '2023-03-27 20:28:24.598475', '24', 'Trinidad and Tobago location', 1, '[{\"added\": {}}]', 9, 1),
(192, '2023-03-27 20:28:28.238205', '9', 'Trinidad and Tovago', 1, '[{\"added\": {}}]', 7, 1),
(193, '2023-03-27 20:33:12.695170', '25', 'Events', 1, '[{\"added\": {}}]', 9, 1),
(194, '2023-03-27 20:33:13.860517', '8', 'Events', 1, '[{\"added\": {}}]', 8, 1),
(195, '2023-03-27 20:34:36.079519', '26', 'Caracazo', 1, '[{\"added\": {}}]', 9, 1),
(196, '2023-03-27 20:35:52.173966', '10', 'Caracazo', 1, '[{\"added\": {}}]', 11, 1),
(197, '2023-03-27 20:36:01.339775', '10', 'Caracazo', 1, '[{\"added\": {}}]', 7, 1),
(198, '2023-03-27 20:37:34.337850', '27', 'Caracazo smoke', 1, '[{\"added\": {}}]', 9, 1),
(199, '2023-03-27 20:38:51.640992', '28', 'Caracazo looters', 1, '[{\"added\": {}}]', 9, 1),
(200, '2023-03-27 20:39:05.667974', '16', 'Unrest: Caracazo', 1, '[{\"added\": {}}]', 12, 1),
(201, '2023-03-27 20:43:23.699068', '29', 'Militar answer in Caracazo', 1, '[{\"added\": {}}]', 9, 1),
(202, '2023-03-27 20:43:27.703919', '17', 'Consecuences: Caracazo', 1, '[{\"added\": {}}]', 12, 1),
(203, '2023-03-27 20:43:48.318745', '29', 'Militar answer during Caracazo', 2, '[{\"changed\": {\"fields\": [\"Image title\"]}}]', 9, 1),
(204, '2023-03-27 20:45:10.641570', '18', 'Important participants: Caracazo', 1, '[{\"added\": {}}]', 12, 1),
(205, '2023-03-27 20:57:15.925162', '6', 'Simón Bolívar', 1, '[{\"added\": {}}]', 13, 1),
(206, '2023-03-27 20:57:38.334543', '7', 'Gran Colombia', 1, '[{\"added\": {}}]', 13, 1),
(207, '2023-03-27 20:57:51.259950', '8', 'Francisco de Miranda', 1, '[{\"added\": {}}]', 13, 1),
(208, '2023-03-27 21:00:00.831218', '1', 'atlantox', 2, '[{\"changed\": {\"fields\": [\"password\"]}}]', 4, 1),
(209, '2023-04-06 19:27:14.499766', '13', 'Simon Bolivar', 2, '[{\"changed\": {\"fields\": [\"Image title\"]}}]', 9, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(7, 'articles', 'article'),
(8, 'articles', 'category'),
(9, 'articles', 'image'),
(13, 'articles', 'relatedarticles'),
(12, 'articles', 'section'),
(10, 'articles', 'sectiontype'),
(11, 'articles', 'summary'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(16, 'comments', 'author'),
(15, 'comments', 'comment'),
(17, 'comments', 'favouritearticles'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session'),
(14, 'WebApp', 'contact');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'WebApp', '0001_initial', '2023-02-27 16:31:20.519363'),
(2, 'contenttypes', '0001_initial', '2023-02-27 16:31:21.070167'),
(3, 'auth', '0001_initial', '2023-02-27 16:31:29.029238'),
(4, 'admin', '0001_initial', '2023-02-27 16:31:31.278139'),
(5, 'admin', '0002_logentry_remove_auto_add', '2023-02-27 16:31:31.352046'),
(6, 'admin', '0003_logentry_add_action_flag_choices', '2023-02-27 16:31:31.453383'),
(7, 'articles', '0001_initial', '2023-02-27 16:31:45.883881'),
(8, 'contenttypes', '0002_remove_content_type_name', '2023-02-27 16:31:46.531596'),
(9, 'auth', '0002_alter_permission_name_max_length', '2023-02-27 16:31:47.336875'),
(10, 'auth', '0003_alter_user_email_max_length', '2023-02-27 16:31:47.493571'),
(11, 'auth', '0004_alter_user_username_opts', '2023-02-27 16:31:47.531605'),
(12, 'auth', '0005_alter_user_last_login_null', '2023-02-27 16:31:47.934559'),
(13, 'auth', '0006_require_contenttypes_0002', '2023-02-27 16:31:47.983685'),
(14, 'auth', '0007_alter_validators_add_error_messages', '2023-02-27 16:31:48.037393'),
(15, 'auth', '0008_alter_user_username_max_length', '2023-02-27 16:31:48.165722'),
(16, 'auth', '0009_alter_user_last_name_max_length', '2023-02-27 16:31:48.870739'),
(17, 'auth', '0010_alter_group_name_max_length', '2023-02-27 16:31:49.288819'),
(18, 'auth', '0011_update_proxy_permissions', '2023-02-27 16:31:49.321014'),
(19, 'auth', '0012_alter_user_first_name_max_length', '2023-02-27 16:31:49.491703'),
(20, 'sessions', '0001_initial', '2023-02-27 16:31:49.889991'),
(21, 'articles', '0002_remove_relatedarticles_related_and_more', '2023-02-27 16:32:53.115776'),
(22, 'articles', '0003_initial', '2023-02-27 16:33:42.663710'),
(23, 'articles', '0004_alter_article_views', '2023-02-27 16:46:53.946327'),
(24, 'articles', '0005_alter_article_other_names', '2023-02-27 17:04:50.587814'),
(25, 'articles', '0006_alter_article_views', '2023-02-27 17:05:45.442232'),
(26, 'articles', '0007_remove_summary_summary_summary_content', '2023-03-05 21:19:23.514649'),
(27, 'articles', '0008_rename_articletype_section_sectiontype', '2023-03-06 21:07:16.965857'),
(28, 'articles', '0009_category_img', '2023-03-07 14:41:13.098173'),
(29, 'articles', '0010_alter_article_main_alter_article_other_names_and_more', '2023-03-13 15:48:15.474790'),
(30, 'articles', '0011_alter_article_main_alter_article_other_names_and_more', '2023-03-16 19:32:02.911786'),
(31, 'comments', '0001_initial', '2023-03-16 19:32:04.550655'),
(32, 'comments', '0002_alter_comment_content_author_comment_author', '2023-03-16 21:48:41.906761'),
(33, 'articles', '0012_remove_summary_article_article_summary', '2023-03-22 14:38:55.359013'),
(34, 'comments', '0003_alter_author_options_alter_author_user_and_more', '2023-03-22 14:39:01.263245'),
(35, 'articles', '0013_summary_title', '2023-03-22 14:42:18.543586'),
(36, 'comments', '0004_alter_favouritearticles_articles', '2023-03-22 20:12:15.941235'),
(37, 'comments', '0005_comment_bloqued', '2023-03-26 16:02:45.914407'),
(38, 'articles', '0014_alter_section_content_alter_summary_content_and_more', '2023-04-04 21:15:18.589104');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('22wvba1nrs54p0z0zh2rg3e7fex6hdmd', '.eJxVjDEOwjAMRe-SGUUNdqnDyM4ZItd2SQE1UtNOiLtDpQ6w_vfef7nE65LTWm1Oo7qzC-7wu_UsD5s2oHeebsVLmZZ57P2m-J1Wfy1qz8vu_h1krvlbm4YYWyKFllQ7AzlSQyzAiAFxYIodD0oI2EAkMkQJJKCseBIS9_4A2fE3wA:1ply7n:Qg_ujkywvFS4P4oPzWfiS8qfc_VDKIVwm48aJDzDLa8', '2023-04-24 20:28:27.176181'),
('6pu113abaphkyzpgrp8dga8ah7wlknv6', '.eJxVjDEOwjAMRe-SGUUNdqnDyM4ZItd2SQE1UtNOiLtDpQ6w_vfef7nE65LTWm1Oo7qzC-7wu_UsD5s2oHeebsVLmZZ57P2m-J1Wfy1qz8vu_h1krvlbm4YYWyKFllQ7AzlSQyzAiAFxYIodD0oI2EAkMkQJJKCseBIS9_4A2fE3wA:1pgtwe:dzJtzcbvn1ERiQiwtKWwducorzhLUumtSzpzeObDeJY', '2023-04-10 21:00:00.946874'),
('lyv9sqtvjb69vsb48fczdp02vv3x9015', '.eJxVjEEOgjAQRe_StWkobZmOS_ecoZnOjIIaSCisjHdXEha6_e-9_zKZtnXIW9Ulj2LOxpnT71aIHzrtQO403WbL87QuY7G7Yg9abT-LPi-H-3cwUB2-NSJ5lYjAAogSGqYGuQCmzgeNVBTa0iVghyGCiwwt-SAhOfVtuIp5fwDhcTeS:1pWgTt:1vYdSAl2c65cvQVTtWQuEKvsG1Rg7oVMjTdNb5F1rNk', '2023-03-13 16:36:05.060484');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `webapp_contact`
--

CREATE TABLE `webapp_contact` (
  `id` bigint(20) NOT NULL,
  `name` varchar(20) NOT NULL,
  `icon` varchar(100) NOT NULL,
  `link` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `articles_article`
--
ALTER TABLE `articles_article`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `summary_id` (`summary_id`);

--
-- Indices de la tabla `articles_article_category`
--
ALTER TABLE `articles_article_category`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `articles_article_category_article_id_category_id_7566d206_uniq` (`article_id`,`category_id`),
  ADD KEY `articles_article_cat_category_id_998f131e_fk_articles_` (`category_id`);

--
-- Indices de la tabla `articles_article_images`
--
ALTER TABLE `articles_article_images`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `articles_article_images_article_id_image_id_a64d93f0_uniq` (`article_id`,`image_id`),
  ADD KEY `articles_article_images_image_id_8a24e451_fk_articles_image_id` (`image_id`);

--
-- Indices de la tabla `articles_category`
--
ALTER TABLE `articles_category`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `articles_category_img_id_da684201_fk_articles_image_id` (`img_id`);

--
-- Indices de la tabla `articles_image`
--
ALTER TABLE `articles_image`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `articles_relatedarticles`
--
ALTER TABLE `articles_relatedarticles`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `articles_relatedarticles_related`
--
ALTER TABLE `articles_relatedarticles_related`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `articles_relatedarticles_relatedarticles_id_artic_d60aa93c_uniq` (`relatedarticles_id`,`article_id`),
  ADD KEY `articles_relatedarti_article_id_bf815cf4_fk_articles_` (`article_id`);

--
-- Indices de la tabla `articles_section`
--
ALTER TABLE `articles_section`
  ADD PRIMARY KEY (`id`),
  ADD KEY `articles_section_targetArticle_id_8c33ec9e_fk_articles_` (`targetArticle_id`),
  ADD KEY `articles_section_sectionType_id_ce36371b_fk_articles_` (`sectionType_id`);

--
-- Indices de la tabla `articles_sectiontype`
--
ALTER TABLE `articles_sectiontype`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indices de la tabla `articles_section_images`
--
ALTER TABLE `articles_section_images`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `articles_section_images_section_id_image_id_09001b15_uniq` (`section_id`,`image_id`),
  ADD KEY `articles_section_images_image_id_d9dd3e7a_fk_articles_image_id` (`image_id`);

--
-- Indices de la tabla `articles_summary`
--
ALTER TABLE `articles_summary`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indices de la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indices de la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indices de la tabla `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indices de la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indices de la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indices de la tabla `comments_author`
--
ALTER TABLE `comments_author`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comments_author_user_id_ba33c815_fk_auth_user_id` (`user_id`);

--
-- Indices de la tabla `comments_comment`
--
ALTER TABLE `comments_comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comments_comment_article_id_94fe60a2_fk_articles_article_id` (`article_id`),
  ADD KEY `comments_comment_author_id_334ce9e2_fk_comments_author_id` (`author_id`);

--
-- Indices de la tabla `comments_favouritearticles`
--
ALTER TABLE `comments_favouritearticles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comments_favouritear_user_id_26dc2c59_fk_comments_` (`user_id`);

--
-- Indices de la tabla `comments_favouritearticles_articles`
--
ALTER TABLE `comments_favouritearticles_articles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `comments_favouritearticl_favouritearticles_id_art_0a04ecb1_uniq` (`favouritearticles_id`,`article_id`),
  ADD KEY `comments_favouritear_article_id_5486f070_fk_articles_` (`article_id`);

--
-- Indices de la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indices de la tabla `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indices de la tabla `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indices de la tabla `webapp_contact`
--
ALTER TABLE `webapp_contact`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `articles_article`
--
ALTER TABLE `articles_article`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `articles_article_category`
--
ALTER TABLE `articles_article_category`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `articles_article_images`
--
ALTER TABLE `articles_article_images`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `articles_category`
--
ALTER TABLE `articles_category`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `articles_image`
--
ALTER TABLE `articles_image`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT de la tabla `articles_relatedarticles`
--
ALTER TABLE `articles_relatedarticles`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `articles_relatedarticles_related`
--
ALTER TABLE `articles_relatedarticles_related`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `articles_section`
--
ALTER TABLE `articles_section`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `articles_sectiontype`
--
ALTER TABLE `articles_sectiontype`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `articles_section_images`
--
ALTER TABLE `articles_section_images`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `articles_summary`
--
ALTER TABLE `articles_summary`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT de la tabla `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `comments_author`
--
ALTER TABLE `comments_author`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `comments_comment`
--
ALTER TABLE `comments_comment`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT de la tabla `comments_favouritearticles`
--
ALTER TABLE `comments_favouritearticles`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `comments_favouritearticles_articles`
--
ALTER TABLE `comments_favouritearticles_articles`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=210;

--
-- AUTO_INCREMENT de la tabla `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT de la tabla `webapp_contact`
--
ALTER TABLE `webapp_contact`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `articles_article`
--
ALTER TABLE `articles_article`
  ADD CONSTRAINT `articles_article_summary_id_234d800c_fk_articles_summary_id` FOREIGN KEY (`summary_id`) REFERENCES `articles_summary` (`id`);

--
-- Filtros para la tabla `articles_article_category`
--
ALTER TABLE `articles_article_category`
  ADD CONSTRAINT `articles_article_cat_article_id_5dd39dbe_fk_articles_` FOREIGN KEY (`article_id`) REFERENCES `articles_article` (`id`),
  ADD CONSTRAINT `articles_article_cat_category_id_998f131e_fk_articles_` FOREIGN KEY (`category_id`) REFERENCES `articles_category` (`id`);

--
-- Filtros para la tabla `articles_article_images`
--
ALTER TABLE `articles_article_images`
  ADD CONSTRAINT `articles_article_ima_article_id_0b6cb70f_fk_articles_` FOREIGN KEY (`article_id`) REFERENCES `articles_article` (`id`),
  ADD CONSTRAINT `articles_article_images_image_id_8a24e451_fk_articles_image_id` FOREIGN KEY (`image_id`) REFERENCES `articles_image` (`id`);

--
-- Filtros para la tabla `articles_category`
--
ALTER TABLE `articles_category`
  ADD CONSTRAINT `articles_category_img_id_da684201_fk_articles_image_id` FOREIGN KEY (`img_id`) REFERENCES `articles_image` (`id`);

--
-- Filtros para la tabla `articles_relatedarticles_related`
--
ALTER TABLE `articles_relatedarticles_related`
  ADD CONSTRAINT `articles_relatedarti_article_id_bf815cf4_fk_articles_` FOREIGN KEY (`article_id`) REFERENCES `articles_article` (`id`),
  ADD CONSTRAINT `articles_relatedarti_relatedarticles_id_20158bde_fk_articles_` FOREIGN KEY (`relatedarticles_id`) REFERENCES `articles_relatedarticles` (`id`);

--
-- Filtros para la tabla `articles_section`
--
ALTER TABLE `articles_section`
  ADD CONSTRAINT `articles_section_sectionType_id_ce36371b_fk_articles_` FOREIGN KEY (`sectionType_id`) REFERENCES `articles_sectiontype` (`id`),
  ADD CONSTRAINT `articles_section_targetArticle_id_8c33ec9e_fk_articles_` FOREIGN KEY (`targetArticle_id`) REFERENCES `articles_article` (`id`);

--
-- Filtros para la tabla `articles_section_images`
--
ALTER TABLE `articles_section_images`
  ADD CONSTRAINT `articles_section_ima_section_id_8bba6a4a_fk_articles_` FOREIGN KEY (`section_id`) REFERENCES `articles_section` (`id`),
  ADD CONSTRAINT `articles_section_images_image_id_d9dd3e7a_fk_articles_image_id` FOREIGN KEY (`image_id`) REFERENCES `articles_image` (`id`);

--
-- Filtros para la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Filtros para la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Filtros para la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `comments_author`
--
ALTER TABLE `comments_author`
  ADD CONSTRAINT `comments_author_user_id_ba33c815_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `comments_comment`
--
ALTER TABLE `comments_comment`
  ADD CONSTRAINT `comments_comment_article_id_94fe60a2_fk_articles_article_id` FOREIGN KEY (`article_id`) REFERENCES `articles_article` (`id`),
  ADD CONSTRAINT `comments_comment_author_id_334ce9e2_fk_comments_author_id` FOREIGN KEY (`author_id`) REFERENCES `comments_author` (`id`);

--
-- Filtros para la tabla `comments_favouritearticles`
--
ALTER TABLE `comments_favouritearticles`
  ADD CONSTRAINT `comments_favouritear_user_id_26dc2c59_fk_comments_` FOREIGN KEY (`user_id`) REFERENCES `comments_author` (`id`);

--
-- Filtros para la tabla `comments_favouritearticles_articles`
--
ALTER TABLE `comments_favouritearticles_articles`
  ADD CONSTRAINT `comments_favouritear_article_id_5486f070_fk_articles_` FOREIGN KEY (`article_id`) REFERENCES `articles_article` (`id`),
  ADD CONSTRAINT `comments_favouritear_favouritearticles_id_a8c6e236_fk_comments_` FOREIGN KEY (`favouritearticles_id`) REFERENCES `comments_favouritearticles` (`id`);

--
-- Filtros para la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
