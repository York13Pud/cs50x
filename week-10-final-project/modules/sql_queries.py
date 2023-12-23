# Get all of the recorded views, along with the article title and author

sql_max_article_views = "SELECT \
                                DISTINCT stats_articleviews.article_views_article_id_fk_id, \
                                stats_articleviews.count,\
                                stats_articles.title \
                        FROM \
                                stats_articleviews \
                        INNER JOIN \
	                        stats_articles ON stats_articleviews.article_views_article_id_fk_id = stats_articles.article_id \
                        GROUP BY \
	                        stats_articleviews.article_views_article_id_fk_id \
                        ORDER BY \
                                stats_articleviews.article_views_article_id_fk_id DESC"


sql_all_article_views = "SELECT stats_articleviews.article_views_article_id_fk_id as id, \
                                stats_articles.title, \
                                stats_articleviews.change, \
                                stats_articleviews.count as view_count, \
                                stats_articleviews.date_added as time_collected, \
                                stats_articles.published_date, \
                                users_user.username as author \
                        FROM stats_articleviews \
                        INNER JOIN stats_articles ON stats_articleviews.article_views_article_id_fk_id = stats_articles.article_id \
                        INNER JOIN users_user ON stats_articles.article_user_id_fk_id = users_user.id \
                        WHERE author = 'dev_neil_a' \
                        ORDER BY stats_articleviews.date_added DESC"


sql_max_article_likes = "SELECT \
		                DISTINCT stats_articlelikes.article_likes_article_id_fk_id, \
		                stats_articlelikes.count, \
                                stats_articles.title \
                        FROM \
                                stats_articlelikes \
                        INNER JOIN \
                                stats_articles ON stats_articlelikes.article_likes_article_id_fk_id = stats_articles.article_id \
                        GROUP BY \
                                stats_articlelikes.article_likes_article_id_fk_id \
                        ORDER BY \
                                stats_articlelikes.article_likes_article_id_fk_id DESC"
                                


sql_max_article_comments = "SELECT \
                                DISTINCT stats_articlecomments.article_comments_article_id_fk_id, \
                                stats_articlecomments.count, \
                                stats_articles.title \
                            FROM \
                                stats_articlecomments \
                            INNER JOIN \
                                stats_articles ON stats_articlecomments.article_comments_article_id_fk_id = stats_articles.article_id \
                            GROUP BY \
                                stats_articlecomments.article_comments_article_id_fk_id \
                            ORDER BY \
                                stats_articlecomments.article_comments_article_id_fk_id DESC"