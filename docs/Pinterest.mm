<map version="1.0.1">
<!-- To view this file, download free mind mapping software FreeMind from http://freemind.sourceforge.net -->
<node CREATED="1672282921106" ID="ID_612137756" MODIFIED="1672282941594" TEXT="Pinterest">
<node CREATED="1672283139205" ID="ID_1766466387" MODIFIED="1672283140172" POSITION="right" TEXT="Growing pains">
<node CREATED="1672283183002" ID="ID_1145494169" MODIFIED="1672283183002" TEXT="In 2011, we hit traction"/>
<node CREATED="1672283193469" ID="ID_1912806085" MODIFIED="1672283193469" TEXT="September 2011, every piece of our infrastructure was over capacity"/>
<node CREATED="1672284624982" ID="ID_831656141" MODIFIED="1672284625424" TEXT="Early 2012: launching new sharding approach"/>
</node>
<node CREATED="1672284191183" ID="ID_834623318" MODIFIED="1672284196974" POSITION="right" TEXT="Dramatic growth">
<node CREATED="1672284216399" ID="ID_675297665" MODIFIED="1672284764399">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      March 2010
    </p>
    <h2 http-equiv="content-type" content="text/html; charset=utf-8" dir="ltr">
      Finding Yourself
    </h2>
  </body>
</html>
</richcontent>
<node CREATED="1672284242315" ID="ID_1390803575" MODIFIED="1672284285025">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      Startup
    </p>
    <ul http-equiv="content-type" content="text/html; charset=utf-8">
      <li dir="ltr">
        <p dir="ltr">
          2 founders
        </p>
      </li>
      <li dir="ltr">
        <p dir="ltr">
          1 engineer
        </p>
      </li>
      <li dir="ltr">
        <p dir="ltr">
          Rackspace
        </p>
      </li>
      <li dir="ltr">
        <p dir="ltr">
          1 small web engine
        </p>
      </li>
      <li dir="ltr">
        <p dir="ltr">
          1 small MySQL DB
        </p>
      </li>
    </ul>
  </body>
</html>
</richcontent>
</node>
</node>
<node CREATED="1672284334378" ID="ID_15239410" MODIFIED="1672284334887" TEXT="January 2011">
<node CREATED="1672284345036" ID="ID_507090418" MODIFIED="1672284347806">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <ul http-equiv="content-type" content="text/html; charset=utf-8">
      <li dir="ltr">
        <p dir="ltr">
          Amazon EC2 + S3 + CloudFront
        </p>
      </li>
      <li dir="ltr">
        <p dir="ltr">
          1 NGinX, 4 Web Engines (for redundancy, not really for load)
        </p>
      </li>
      <li dir="ltr">
        <p dir="ltr">
          1 MySQL DB + 1 Read Slave (in case master goes down)
        </p>
      </li>
      <li dir="ltr">
        <p dir="ltr">
          1 Task Queue + 2 Task Processors
        </p>
      </li>
      <li dir="ltr">
        <p dir="ltr">
          1 MongoDB (for counters)
        </p>
      </li>
      <li dir="ltr">
        <p dir="ltr">
          2 Engineers
        </p>
      </li>
    </ul>
  </body>
</html>
</richcontent>
</node>
</node>
<node CREATED="1672284365004" ID="ID_977999201" MODIFIED="1672284782011">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      Sept 2011
    </p>
    <h2 http-equiv="content-type" content="text/html; charset=utf-8" dir="ltr">
      Experimentation
    </h2>
  </body>
</html>
</richcontent>
<node CREATED="1672284383470" ID="ID_1749711399" MODIFIED="1672284491121" TEXT="Insane growth: traffic doubling every month and half">
<node CREATED="1672284502161" ID="ID_1634027520" MODIFIED="1672284502161" TEXT="everything breaks every night and every week"/>
<node CREATED="1672284520564" ID="ID_663013021" MODIFIED="1672284520564" TEXT="they start adding a lot of technology. They all break"/>
</node>
<node CREATED="1672284540121" ID="ID_652675956" MODIFIED="1672288394646">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      As a result you end up with a very complicated picture:
    </p>
    <ul http-equiv="content-type" content="text/html; charset=utf-8">
      <li dir="ltr">
        <p dir="ltr">
          Amazon EC2 + S3 + CloudFront
        </p>
      </li>
      <li dir="ltr">
        <p dir="ltr">
          2NGinX, 16 Web Engines + 2 API Engines
        </p>
      </li>
      <li dir="ltr">
        <p dir="ltr">
          5 Functionally sharded MySQL DB + 9 read slaves
        </p>
      </li>
      <li dir="ltr">
        <p dir="ltr">
          4 Cassandra Nodes
        </p>
      </li>
      <li dir="ltr">
        <p dir="ltr">
          15 Membase Nodes (3 separate clusters)
        </p>
      </li>
      <li dir="ltr">
        <p dir="ltr">
          8 Memcache Nodes
        </p>
      </li>
      <li dir="ltr">
        <p dir="ltr">
          10 Redis Nodes
        </p>
      </li>
      <li dir="ltr">
        <p dir="ltr">
          3 Task Routers + 4 Task Processors
        </p>
      </li>
      <li dir="ltr">
        <p dir="ltr">
          4 Elastic Search Nodes
        </p>
      </li>
      <li dir="ltr">
        <p dir="ltr">
          3 Mongo Clusters
        </p>
      </li>
      <li dir="ltr">
        <p dir="ltr">
          3 Engineers
        </p>
      </li>
    </ul>
  </body>
</html>
</richcontent>
<node CREATED="1672284581603" ID="ID_51992563" MODIFIED="1672284581603" TEXT="5 major database technologies for just their data alone"/>
<node CREATED="1672284593365" ID="ID_1978475526" MODIFIED="1672284593365" TEXT="Growing so fast that MySQL was hot and all the other technologies were being pushed to the limits."/>
<node CREATED="1672284696141" ID="ID_1807666557" MODIFIED="1672284696617" TEXT="When you push something to the limit all these technologies fail in their own special way."/>
<node CREATED="1672284709046" ID="ID_1028982363" MODIFIED="1672284710669" TEXT="Started dropping technologies and asked themselves what they really wanted to be. Did a massive rearchitecture of everything."/>
</node>
</node>
<node CREATED="1672284724266" ID="ID_1494869372" MODIFIED="1672284777637">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      January 2012
    </p>
    <h2 http-equiv="content-type" content="text/html; charset=utf-8" dir="ltr">
      Maturity
    </h2>
  </body>
</html>
</richcontent>
<node CREATED="1672284811866" ID="ID_1584473390" MODIFIED="1672288803013">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      After everything was rearchitected the system now looks like
    </p>
    <ul http-equiv="content-type" content="text/html; charset=utf-8">
      <li>
        <p dir="ltr">
          Amazon EC2 + S3 + Akamai, ELB
        </p>
      </li>
      <li dir="ltr">
        <p dir="ltr">
          90 Web Engines + 50 API Engines
        </p>
      </li>
      <li dir="ltr">
        <p dir="ltr">
          66 MySQL DBs (m1.xlarge) + 1 slave each
        </p>
      </li>
      <li dir="ltr">
        <p dir="ltr">
          59 Redis Instances
        </p>
      </li>
      <li dir="ltr">
        <p dir="ltr">
          51 Memcache Instances
        </p>
      </li>
      <li dir="ltr">
        <p dir="ltr">
          1 Redis Task Manager + 25 Task Processors
        </p>
      </li>
      <li dir="ltr">
        <p dir="ltr">
          Sharded Solr
        </p>
      </li>
      <li dir="ltr">
        <p dir="ltr">
          6 Engineers
        </p>
      </li>
    </ul>
  </body>
</html>
</richcontent>
<node CREATED="1672284885860" ID="ID_409607912" MODIFIED="1672284894143" TEXT="Now on sharded MySQL, Redis, Memcache, and Solr. &#xa;That&#x2019;s it. The advantage is it&#x2019;s really simple and mature technologies"/>
<node CREATED="1672284905343" ID="ID_1148705933" MODIFIED="1672284905868" TEXT="Web traffic keeps going up at the same velocity and iPhone traffic starts ramping up."/>
</node>
</node>
<node CREATED="1672284920648" ID="ID_462048623" MODIFIED="1672284928035">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      October 2012
    </p>
    <h2 http-equiv="content-type" content="text/html; charset=utf-8" dir="ltr">
      Return
    </h2>
  </body>
</html>
</richcontent>
<node CREATED="1672284951703" ID="ID_1711671115" MODIFIED="1672288890834">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      About 4x where they were in January:
    </p>
    <ul http-equiv="content-type" content="text/html; charset=utf-8">
      <li dir="ltr">
        <p dir="ltr">
          Amazon EC2 + S3 + Edge Cast,Akamai, Level 3
        </p>
      </li>
      <li>
        <p dir="ltr">
          180 Web Engines + 240 API Engines
        </p>
      </li>
      <li>
        <p dir="ltr">
          88 MySQL DBs (cc2.8xlarge) + 1 slave each
        </p>
      </li>
      <li>
        <p dir="ltr">
          110 Redis Instances
        </p>
      </li>
      <li>
        <p dir="ltr">
          200 Memcache Instances
        </p>
      </li>
      <li>
        <p dir="ltr">
          4 Redis Task Manager + 80 Task Processors
        </p>
      </li>
      <li>
        <p dir="ltr">
          Sharded Solr
        </p>
      </li>
      <li>
        <p dir="ltr">
          40 Engineers (and growing)
        </p>
      </li>
    </ul>
  </body>
</html>
</richcontent>
<node CREATED="1672285020107" ID="ID_1746099840" MODIFIED="1672285020107" TEXT="Notice that the architecture is doing the right thing. Growth is by adding more of the same stuff"/>
<node CREATED="1672285027227" ID="ID_299300213" MODIFIED="1672285027227" TEXT="Now moving to SSDs"/>
</node>
</node>
</node>
<node CREATED="1672285137305" ID="ID_1765010258" MODIFIED="1672285147949" POSITION="right" TEXT="Architecture decision">
<node CREATED="1672285152906" ID="ID_187093943" MODIFIED="1672285153301" TEXT="Why Amazon EC2/S3?"/>
<node CREATED="1672285157855" ID="ID_1799414396" MODIFIED="1672285158129" TEXT="Why MySQL?"/>
<node CREATED="1672285161576" ID="ID_1339639563" MODIFIED="1672285161939" TEXT="Why Memcache?"/>
<node CREATED="1672285165002" ID="ID_1539725361" MODIFIED="1672285165396" TEXT="Why Redis?"/>
<node CREATED="1672285169492" ID="ID_510937890" MODIFIED="1672285169939" TEXT="Solr"/>
<node CREATED="1672285173393" ID="ID_1913319366" MODIFIED="1672285174865" TEXT="Clustering vs Sharding">
<font BOLD="true" NAME="SansSerif" SIZE="12"/>
<node CREATED="1672285353120" ID="ID_1243596926" MODIFIED="1672285353677" TEXT="Clustering - everything is automatic">
<node CREATED="1672286070059" ID="ID_1554656785" MODIFIED="1672286070059" TEXT="Examples: Cassandra, MemBase, HBase"/>
<node CREATED="1672286129866" ID="ID_901854693" MODIFIED="1672286136636" TEXT="Verdict: too scary, maybe in the future, but for now it&#x2019;s too complicated&#xa; and has way too many failure modes."/>
<node CREATED="1672286140414" ID="ID_960158155" MODIFIED="1672286140693" TEXT="Properties">
<node CREATED="1672286152234" ID="ID_997168610" MODIFIED="1672286152234" TEXT="Data distributed automatically"/>
<node CREATED="1672286152236" ID="ID_679139853" MODIFIED="1672286152236" TEXT="Data can move"/>
<node CREATED="1672286152237" ID="ID_344834960" MODIFIED="1672286152237" TEXT="Rebalance to distribute capacity"/>
<node CREATED="1672286152237" ID="ID_123613575" MODIFIED="1672286160509" TEXT="Nodes communicate with each other. A lot of crosstalk, gossiping and negotiation.">
<font BOLD="true" NAME="SansSerif" SIZE="12"/>
</node>
</node>
<node CREATED="1672286168097" ID="ID_513662250" MODIFIED="1672286168393" TEXT="Pros:">
<node CREATED="1672286186653" ID="ID_1919413133" MODIFIED="1672286186653" TEXT="Automatically scale your datastore. That&#x2019;s what the white papers say at least."/>
<node CREATED="1672286186654" ID="ID_89209159" MODIFIED="1672286186654" TEXT="Easy to setup."/>
<node CREATED="1672286186655" ID="ID_1832589877" MODIFIED="1672286186655" TEXT="Spatially distribute and colocate your data. You can have datacenter in different regions and the database takes care of it."/>
<node CREATED="1672286186657" ID="ID_1806133467" MODIFIED="1672286186657" TEXT="High availability"/>
<node CREATED="1672286186658" ID="ID_504429695" MODIFIED="1672286186658" TEXT="Load balancing"/>
<node CREATED="1672286186659" ID="ID_1667356379" MODIFIED="1672286186659" TEXT="No single point of failure"/>
</node>
<node CREATED="1672286195716" FOLDED="true" ID="ID_1034711226" MODIFIED="1672286304761" TEXT="Cons (from first hand experience)">
<node CREATED="1672286279437" MODIFIED="1672286279437" TEXT="Still fairly young."/>
<node CREATED="1672286279437" MODIFIED="1672286279437" TEXT="Fundamentally complicated. A whole bunch nodes have to symmetrical agreement, which is a hard problem to solve in production."/>
<node CREATED="1672286279438" MODIFIED="1672286279438" TEXT="Less community support. There&#x2019;s a split in the community along different product lines so there&#x2019;s less support in each camp."/>
<node CREATED="1672286279439" MODIFIED="1672286279439" TEXT="Fewer engineers with working knowledge. Probably most engineers have not used Cassandra."/>
<node CREATED="1672286279440" MODIFIED="1672286279440" TEXT="Difficult and scary upgrade mechanisms. Could be related to they all use an API and talk amongst themselves so you don&#x2019;t want them to be confused. This leads to complicated upgrade paths."/>
<node CREATED="1672286279441" MODIFIED="1672286279441" TEXT="Cluster Management Algorithm is a SPOF. If there&#x2019;s a bug it impacts every node. This took them down 4 times."/>
<node CREATED="1672286286469" ID="ID_1974264889" MODIFIED="1672286286469" TEXT="Cluster Managers are complex code replicated over all nodes that have the following failure modes:">
<node CREATED="1672286295038" MODIFIED="1672286295038" TEXT="Data rebalance breaks. Bring a new box and data starts replicating and then it gets stuck. What do you do? There aren&#x2019;t tools to figure out what&#x2019;s going on. There&#x2019;s no community to help, so they were stuck. They reverted back to MySQL."/>
<node CREATED="1672286295045" MODIFIED="1672286295045" TEXT="Data corruption across all nodes. What if there&#x2019;s a bug that sprays badness into the write log across all of them and compaction or some other mechanism stops? Your read latencies increase. All your data is screwed and the data is gone."/>
<node CREATED="1672286295050" MODIFIED="1672286295050" TEXT="Improper balancing that cannot be easily fixed. Very common. You have 10 nodes and you notice all the node is on one node. There&#x2019;s a manual process, but it redistributes the load back to one node."/>
<node CREATED="1672286295055" MODIFIED="1672286295055" TEXT="Data authority failure. Clustering schemes are very smart. In one case they bring in a new secondary. At about 80% the secondary says it&#x2019;s primary and the primary goes to secondary and you&#x2019;ve lost 20% of the data. Losing 20% of the data is worse than losing all of it because you don&#x2019;t know what you&#x2019;ve lost."/>
</node>
</node>
</node>
<node CREATED="1672285848913" ID="ID_769275618" MODIFIED="1672285848913" TEXT="Sharding - everything is manual">
<node CREATED="1672286359159" ID="ID_254302752" MODIFIED="1672286359159" TEXT="Verdict: It&#x2019;s the winner."/>
<node CREATED="1672286367070" ID="ID_1240766751" MODIFIED="1672286367070" TEXT="Properties">
<node CREATED="1672286386913" ID="ID_28849747" MODIFIED="1672286386913" TEXT="Get rid of all the properties of clustering that you don&#x2019;t like and you get sharding."/>
<node CREATED="1672286386914" ID="ID_738814205" MODIFIED="1672286386914" TEXT="Data distributed manually"/>
<node CREATED="1672286386915" ID="ID_876785451" MODIFIED="1672286399049" TEXT="Data does not move. They don&#x2019;t ever move data, though some people do, which puts them higher on the spectrum.">
<font BOLD="true" NAME="SansSerif" SIZE="12"/>
</node>
<node CREATED="1672286386918" ID="ID_458423276" MODIFIED="1672286418071" TEXT="Split data to distribute load.">
<font BOLD="true" NAME="SansSerif" SIZE="12"/>
</node>
<node CREATED="1672286386919" ID="ID_621736504" MODIFIED="1672286386919" TEXT="Nodes are not aware of each other. Some master node controls everything."/>
</node>
<node CREATED="1672286426636" ID="ID_1084391185" MODIFIED="1672286427024" TEXT="Pros">
<node CREATED="1672286465877" ID="ID_821299060" MODIFIED="1672286465877" TEXT="Can split your database to add more capacity."/>
<node CREATED="1672286465878" ID="ID_1469046741" MODIFIED="1672286465878" TEXT="Spatially distribute and collocate your data"/>
<node CREATED="1672286465879" ID="ID_513211258" MODIFIED="1672286465879" TEXT="High availability"/>
<node CREATED="1672286465879" ID="ID_1551924242" MODIFIED="1672286465879" TEXT="Load balancing"/>
<node CREATED="1672286465880" ID="ID_1841475519" MODIFIED="1672286465880" TEXT="Algorithm for placing data is very simple. The main reason. Has a SPOF, but it&#x2019;s half a page of code rather than a very complicated Cluster Manager. After the first day it will work or won&#x2019;t work."/>
<node CREATED="1672286465884" ID="ID_1826630193" MODIFIED="1672286465884" TEXT="ID generation is simplistic."/>
</node>
<node CREATED="1672286483767" ID="ID_593423123" MODIFIED="1672286484278" TEXT="Cons">
<node CREATED="1672286507936" ID="ID_1793686249" MODIFIED="1672286507936" TEXT="Can&#x2019;t perform most joins."/>
<node CREATED="1672286507938" ID="ID_287285076" MODIFIED="1672286507938" TEXT="Lost all transaction capabilities. A write to one database may fail when a write to another succeeds."/>
<node CREATED="1672286507941" ID="ID_156581287" MODIFIED="1672286507941" TEXT="Many constraints must be moved to the application layer."/>
<node CREATED="1672286507942" ID="ID_422776830" MODIFIED="1672286507942" TEXT="Schema changes require more planning."/>
<node CREATED="1672286507942" ID="ID_312003996" MODIFIED="1672286507942" TEXT="Reports require running queries on all shards and then perform all the aggregation yourself."/>
<node CREATED="1672286507943" ID="ID_1653966402" MODIFIED="1672286507943" TEXT="Joins are performed in the application layer."/>
<node CREATED="1672286507944" ID="ID_580578621" MODIFIED="1672286507944" TEXT="Your application must be tolerant to all these issues."/>
</node>
</node>
<node CREATED="1672285895247" ID="ID_794152044" MODIFIED="1672285895593" TEXT="When to shard?">
<node CREATED="1672286538043" ID="ID_152024173" MODIFIED="1672286538043" TEXT="If your project will have a few TBs of data then you should shard as soon as possible."/>
<node CREATED="1672286538044" ID="ID_1909879165" MODIFIED="1672286538044" TEXT="When the Pin table went to a billion rows the indexes ran out of memory and they were swapping to disk."/>
<node CREATED="1672286538047" ID="ID_1695161087" MODIFIED="1672286538047" TEXT="They picked the largest table and put it in its own database."/>
<node CREATED="1672286538048" ID="ID_1485779133" MODIFIED="1672286538048" TEXT="Then they ran out of space on the single database."/>
<node CREATED="1672286538049" ID="ID_1083779551" MODIFIED="1672286538049" TEXT="Then they had to shard."/>
</node>
<node CREATED="1672285900847" ID="ID_1689071515" MODIFIED="1672285901306" TEXT="Transition to Sharding">
<node CREATED="1672286593566" ID="ID_1866367288" MODIFIED="1672286593566" TEXT="Started the transition process with a feature freeze."/>
<node CREATED="1672286593568" ID="ID_1604569827" MODIFIED="1672286593568" TEXT="Then they decided how they wanted to shard. Want to perform the least amount of queries and go to least number of databases to render a single page."/>
<node CREATED="1672286593571" ID="ID_16918967" MODIFIED="1672286593571" TEXT="Removed all MySQL joins. Since the tables could be loaded into separate partitions joins would not work."/>
<node CREATED="1672286593574" ID="ID_1279558798" MODIFIED="1672286593574" TEXT="Added a ton of cache. Basically every query has to be cached."/>
<node CREATED="1672286593575" ID="ID_1844941212" MODIFIED="1672286593575" TEXT="The steps looked like:">
<node CREATED="1672286604848" ID="ID_126148653" MODIFIED="1672286604848" TEXT="1 DB + Foreign Keys + Joins"/>
<node CREATED="1672286604850" ID="ID_1825088017" MODIFIED="1672286604850" TEXT="1 DB + Denormalized + Cache"/>
<node CREATED="1672286604850" ID="ID_1801803270" MODIFIED="1672286604850" TEXT="1 DB + Read Slaves + Cache"/>
<node CREATED="1672286604851" ID="ID_766177330" MODIFIED="1672286604851" TEXT="Several functionally sharded DBs + Read slaves + Cache"/>
<node CREATED="1672286604851" ID="ID_908263550" MODIFIED="1672286604851" TEXT="ID sharded DBs + Backup slaves + cache"/>
</node>
<node CREATED="1672286710321" ID="ID_1183858278" MODIFIED="1672286710321" TEXT="Earlier read slaves became a problem because of slave lag. A read would go to the slave and the master hadn&#x2019;t replicated the record yet, so it looked like a record was missing. Getting around that require cache."/>
<node CREATED="1672286710325" ID="ID_1975170992" MODIFIED="1672286710325" TEXT="They have background scripts that duplicate what the database used to do. Check for integrity constraints, references."/>
<node CREATED="1672286710328" ID="ID_143864152" MODIFIED="1672286710328" TEXT="User table is unsharded. They just use a big database and have a uniqueness constraint on user name and email. Inserting a User will fail if it isn&#x2019;t unique. Then they do a lot of writes in their sharded database."/>
</node>
<node CREATED="1672285908558" ID="ID_1485292841" MODIFIED="1672285909214" TEXT="How to Shard?">
<node CREATED="1672286798144" ID="ID_1352867061" MODIFIED="1672286798144" TEXT="Looked at Cassandra&#x2019;s ring model. Looked at Membase. And looked at Twitter&#x2019;s Gizzard."/>
<node CREATED="1672286798145" ID="ID_449426998" MODIFIED="1672286798145" TEXT="Determined: the least data you move across your nodes the more stable your architecture."/>
<node CREATED="1672286798146" ID="ID_1685539867" MODIFIED="1672286798146" TEXT="Cassandra has a data balancing and authority problems because the nodes weren&#x2019;t sure of who owned which part of the data. They decided the application should decide where the data should go so there is never an issue."/>
<node CREATED="1672286798151" ID="ID_1645507007" MODIFIED="1672286798151" TEXT="Projected their growth out for the next five years and presharded with that capacity plan in mind."/>
<node CREATED="1672286798154" ID="ID_1612151140" MODIFIED="1672286798154" TEXT="Initially created a lot of virtual shards. 8 physical servers, each with 512 DBs. All the databases have all the tables."/>
<node CREATED="1672286798157" ID="ID_1897995875" MODIFIED="1672286798157" TEXT="For high availability they always run in multi-master replication mode. Each master is assigned to a different availability zone. On failure the switch to the other master and bring in a new replacement node."/>
<node CREATED="1672286798160" ID="ID_659342452" MODIFIED="1672286878448" TEXT="When load increasing on a database:">
<font BOLD="true" NAME="SansSerif" SIZE="12"/>
<node CREATED="1672286852225" ID="ID_774598865" MODIFIED="1672286852225" TEXT="Look at code commits to see if a new feature, caching issue, or other problem occurred."/>
<node CREATED="1672286852225" ID="ID_1971246266" MODIFIED="1672286852225" TEXT="If it&#x2019;s just a load increase they split the database and tell the applications to find the data on a new host."/>
<node CREATED="1672286852226" ID="ID_933706852" MODIFIED="1672286852226" TEXT="Before splitting the database they start slaves for those masters. Then they swap application code with the new database assignments. In the few minutes during the transition writes are still write to old nodes and be replicated to the new nodes. Then the pipe is cut between the nodes."/>
</node>
</node>
</node>
</node>
<node CREATED="1672283060692" ID="ID_559506638" MODIFIED="1672283071413" POSITION="left" TEXT="business intro">
<node CREATED="1672283082020" ID="ID_588025087" MODIFIED="1672283082020" TEXT="is a discovery engine for everything that interests you"/>
<node CREATED="1672283090035" ID="ID_366308653" MODIFIED="1672283090035" TEXT="is the largest human curated interest graph in the world">
<node CREATED="1672283098646" ID="ID_204898129" MODIFIED="1672283161427">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      There are more than 50 billion Pins
    </p>
    <p>
      that have been saved by Pinners onto one billion boards
    </p>
  </body>
</html>
</richcontent>
</node>
</node>
<node CREATED="1672283117351" HGAP="22" ID="ID_801075502" MODIFIED="1672283122180" TEXT="People repin and like other Pins (roughly a shallow copy), follow other Pinners, boards and interests, and view a home feed of all the Pinners, boards and interests they follow" VSHIFT="8"/>
</node>
<node CREATED="1672283906528" ID="ID_97219351" MODIFIED="1672286037402" POSITION="left" TEXT="lessons">
<font BOLD="true" NAME="SansSerif" SIZE="12"/>
<node CREATED="1672283916159" ID="ID_1901352664" MODIFIED="1672290152155">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      When you push something to the limit
    </p>
    <p>
      all technologies fail in their own special way
    </p>
  </body>
</html>
</richcontent>
<node CREATED="1672283965198" ID="ID_963694328" MODIFIED="1672290244102">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      This lead them to evaluate tool:
    </p>
    <p>
      mature; really good and simple;
    </p>
    <p>
      well known and liked; well supported;
    </p>
    <p>
      consistently good performers;
    </p>
    <p>
      failure free as possible; free
    </p>
  </body>
</html>
</richcontent>
<node CREATED="1672284041421" ID="ID_1589016304" MODIFIED="1672284042469" TEXT="they selected: MySQL, Solr, Memcache, and Redis"/>
<node CREATED="1672284054172" ID="ID_974389275" MODIFIED="1672284054591" TEXT="Cassandra and Mongo were dropped"/>
</node>
</node>
<node CREATED="1672284078143" ID="ID_1256524944" MODIFIED="1672284080125" TEXT="Architecture is doing the right thing when growth can be handled by adding more of the same stuff"/>
</node>
<node CREATED="1672283216848" ID="ID_100474787" MODIFIED="1672283226239" POSITION="left" TEXT="re-architected entire data storage model">
<node CREATED="1672283230157" ID="ID_1314637383" MODIFIED="1672291776345" TEXT="Requirements">
<node CREATED="1672283263669" ID="ID_1839636212" MODIFIED="1672283263669" TEXT="overall system needed to be very stable, easy to operate and scale to the moon"/>
<node CREATED="1672283397773" ID="ID_727494460" MODIFIED="1672283397773" TEXT="All Pinner generated content must be site accessible at all times."/>
<node CREATED="1672283412353" ID="ID_1555171557" MODIFIED="1672283528655" TEXT="Support asking for N number of Pins in a board in a deterministic order&#xa; (such as reverse creation time or user specified ordering). &#xa;Same for Pinner to likes, Pinner to Pins, etc."/>
</node>
<node CREATED="1672283446598" ID="ID_1074269530" MODIFIED="1672291639982" TEXT="Design philosophies">
<node CREATED="1672283486878" ID="ID_1601729939" MODIFIED="1672283513469" TEXT="we wanted this data to span multiple databases, &#xa;we couldn&#x2019;t use the database&#x2019;s joins, foreign keys"/>
<node CREATED="1672283541961" ID="ID_526425273" MODIFIED="1672283541961" TEXT="needed to support load balancing our data">
<node CREATED="1672283554100" ID="ID_461110499" MODIFIED="1672283554100" TEXT="hated moving data around, especially item by item"/>
<node CREATED="1672283560549" ID="ID_1211936030" MODIFIED="1672283560549" TEXT="it was better to move an entire virtual node to a different physical node"/>
</node>
<node CREATED="1672283584849" ID="ID_1199069035" MODIFIED="1672283584849" TEXT="needed the simplest usable solution and VERY stable nodes in our distributed data platform"/>
<node CREATED="1672283607571" ID="ID_1194137315" MODIFIED="1672283607571" TEXT="only interact with the master in production">
<node CREATED="1672283624336" ID="ID_831881585" MODIFIED="1672283624336" TEXT="You never want to read/write to a slave in production. Slaves lag, which causes strange bugs."/>
<node CREATED="1672283630446" ID="ID_1138562244" MODIFIED="1672283630446" TEXT="Once you&#x2019;re sharded, there&#x2019;s generally no advantage to interacting with a slave"/>
</node>
<node CREATED="1672283646522" ID="ID_1798416951" MODIFIED="1672283646522" TEXT="we needed a nice way to generate universally unique IDs (UUID) for all of our objects"/>
</node>
</node>
</node>
</map>
