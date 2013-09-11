USER="appfactory"
PASS="xxxx"
DATABASES=""
MYSQL_HOST="appfactory-prod.xxxxx.xxxx.amazonaws.com"

# Drop Existing DBs
for db in api_mgt_registry apimgt jpadb registry rss_dev rss_prod rss_staging rss_test userstore appfactory_config as_dev_config as_prod_config as_test_config as_staging_config ss_dev_config ss_prod_config ss_test_config ss_staging_config api_mgt_config af_bps_config redmine sc_config
do 
	mysql -h $MYSQL_HOST -u$USER -p$PASS -Bse "drop database if exists $db"
done

# Create DBs
for db in api_mgt_registry apimgt jpadb registry rss_dev rss_prod rss_staging rss_test userstore appfactory_config as_dev_config as_prod_config as_test_config as_staging_config ss_dev_config ss_prod_config ss_test_config ss_staging_config api_mgt_config af_bps_config redmine sc_config
do 
	mysql -h $MYSQL_HOST -u$USER -p$PASS -Bse "create database $db"
done


#mysql -h $MYSQL_HOST -u$USER -p$PASS -D mysql -Bse "INSERT INTO user  (User,Host,Password) VALUES('jpadb','%',PASSWORD('keeW3keiqu5aiKieL2eeT2Aisaigoo'));"

mysql -h $MYSQL_HOST -u$USER -p$PASS  -Bse "grant all on registry.* to registry identified by 'xxxxx'"
mysql -h $MYSQL_HOST -u$USER -p$PASS  -Bse "grant all on sc_config.* to registry identified by 'xxxxx'"
mysql -h $MYSQL_HOST -u$USER -p$PASS  -Bse "grant all on appfactory_config.* to registry identified by 'xxxxx'"
mysql -h $MYSQL_HOST -u$USER -p$PASS  -Bse "grant all on as_dev_config.* to registry identified by 'xxxxx'"
mysql -h $MYSQL_HOST -u$USER -p$PASS  -Bse "grant all on as_prod_config.* to registry identified by 'xxxxx'"
mysql -h $MYSQL_HOST -u$USER -p$PASS  -Bse "grant all on as_test_config.* to registry identified by 'xxxxx'"
mysql -h $MYSQL_HOST -u$USER -p$PASS  -Bse "grant all on as_staging_config.* to registry identified by 'xxxxx'"
mysql -h $MYSQL_HOST -u$USER -p$PASS  -Bse "grant all on ss_dev_config.* to registry identified by 'xxxxx'"
mysql -h $MYSQL_HOST -u$USER -p$PASS  -Bse "grant all on ss_prod_config.* to registry identified by 'xxxxx'"
mysql -h $MYSQL_HOST -u$USER -p$PASS  -Bse "grant all on ss_test_config.* to registry identified by 'xxxxx'"
mysql -h $MYSQL_HOST -u$USER -p$PASS  -Bse "grant all on ss_staging_config.* to registry identified by 'xxxxx'"
mysql -h $MYSQL_HOST -u$USER -p$PASS  -Bse "grant all on api_mgt_config.* to registry identified by 'xxxxx'"
mysql -h $MYSQL_HOST -u$USER -p$PASS  -Bse "grant all on af_bps_config.* to registry identified by 'xxxxx'"
mysql -h $MYSQL_HOST -u$USER -p$PASS  -Bse "grant all on userstore.* to userstore identified by 'xxxx'"
mysql -h $MYSQL_HOST -u$USER -p$PASS  -Bse "grant all on jpadb.* to jpadb identified by 'xxxx'"
mysql -h $MYSQL_HOST -u$USER -p$PASS  -Bse "grant all on redmine.* to admin identified by 'xxxx'"
mysql -h $MYSQL_HOST -u$USER -p$PASS  -Bse "grant all on redmine.* to redmine identified by 'xxxx'"
mysql -h $MYSQL_HOST -u$USER -p$PASS  -Bse "grant all on s2_foundation.* to s2user identified by 'xxxxx'"
mysql -h $MYSQL_HOST -u$USER -p$PASS  -Bse "grant all on rss_dev.* to rss_dev identified by 'xxxxx'"
mysql -h $MYSQL_HOST -u$USER -p$PASS  -Bse "grant all on rss_prod.* to rss_prod identified by 'xxxxx'"
mysql -h $MYSQL_HOST -u$USER -p$PASS  -Bse "grant all on rss_test.* to rss_prod identified by 'xxxxx'"
mysql -h $MYSQL_HOST -u$USER -p$PASS  -Bse "grant all on rss_staging.* to rss_staging identified by 'xxxxx'"
mysql -h $MYSQL_HOST -u$USER -p$PASS  -Bse "grant all on apimgt.* to apimgt identified by 'xxxxx'"
mysql -h $MYSQL_HOST -u$USER -p$PASS  -Bse "grant all on api_mgt_registry.* to apimgt identified by 'xxxxx'"



for db in appfactory_config as_dev_config as_prod_config as_test_config as_staging_config ss_dev_config ss_prod_config ss_test_config ss_staging_config api_mgt_config af_bps_config api_mgt_registry  registry userstore sc_config
do
	mysql -h $MYSQL_HOST -u$USER -p$PASS $db < dbscripts/registry.sql
done

for db in apimgt jpadb 
do
	mysql -h $MYSQL_HOST -u$USER -p$PASS $db < dbscripts/$db.sql
done

#for env in dev staging test prod
for env in dev staging test prod
do
	mysql -h $MYSQL_HOST -u$USER -p$PASS rss_$env < dbscripts/wso2_rss_mysql.sql
done

mysql -h $MYSQL_HOST -u$USER -p$PASS redmine <  redmine.sql.withsettings
exit 
