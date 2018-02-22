console.log("#"+ <%="#{comment.article_id}_#{comment.id}"%>);
$("#"+ <%="#{comment.article_id}_#{comment.id}"%>).html("<%= j render(:partial => 'edit', :locals =>{ :comment => @comment }) %>");