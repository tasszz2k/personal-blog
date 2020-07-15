/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tasszz2k.dao.impl;

import com.tasszz2k.dao.base.ICommentDAO;
import com.tasszz2k.mapper.CommentMapper;
import com.tasszz2k.model.CommentModel;
import com.tasszz2k.model.UserModel;
import com.tasszz2k.paging.Pageble;
import java.util.List;
import org.apache.commons.lang.StringUtils;

/**
 *
 * @author TASS
 */
public class CommentDAO extends AbstractDAO<CommentModel> implements ICommentDAO {

    @Override
    public Long save(CommentModel commentModel) {
        StringBuilder sql = new StringBuilder("INSERT INTO dbo.comment\n"
                + "(content,user_id,news_id,createddate,createdby)\n"
                + "VALUES\n"
                + "(   ?, ?, ?, GETDATE(),\n"
                + "    (\n"
                + "        SELECT username FROM dbo.[user] WHERE id = ?\n"
                + "    ));");
        return insert(sql.toString(), commentModel.getContent(), commentModel.getUserId(), commentModel.getNewsId(), commentModel.getUserId());
    }

    @Override
    public CommentModel findOne(Long id) {
        StringBuilder sql = new StringBuilder("SELECT comment.id, comment.content,comment.user_id,comment.news_id,\n"
                + "	comment.createddate,comment.createdby,\n"
                + "	dbo.[user].fullname,dbo.[user].avatar,\n"
                + "	dbo.news.title		\n"
                + "FROM dbo.comment\n"
                + "INNER JOIN dbo.[user] ON [user].id = comment.user_id\n"
                + "INNER JOIN dbo.news ON news.id = comment.news_id\n"
                + "WHERE  comment.id = ?");
        List<CommentModel> comments = query(sql.toString(), new CommentMapper(), id);
        return comments.isEmpty() ? null : comments.get(0);
    }

    @Override
    public List<CommentModel> findAll(Pageble pageble) {
        StringBuilder sql = new StringBuilder("SELECT comment.id, comment.content,comment.user_id,comment.news_id,\n"
                + "	comment.createddate,comment.createdby,\n"
                + "	dbo.[user].fullname,dbo.[user].avatar,\n"
                + "	dbo.news.title		\n"
                + "FROM dbo.comment\n"
                + "INNER JOIN dbo.[user] ON [user].id = comment.user_id\n"
                + "INNER JOIN dbo.news ON news.id = comment.news_id");
        if (pageble.getSorter() != null
                && StringUtils.isNotBlank(pageble.getSorter().getSortBy())
                && StringUtils.isNotBlank(pageble.getSorter().getSortType())) {
            sql.append(" ORDER BY " + pageble.getSorter().getSortBy() + " " + pageble.getSorter().getSortType() + "\n");
        }
        if (pageble.getOffset() != null && pageble.getLimit() != null) {
            sql.append(" OFFSET " + pageble.getOffset() + " ROWS\n"
                    + "FETCH NEXT " + pageble.getLimit() + " ROW ONLY ");
        }
        return query(sql.toString(), new CommentMapper());
    }

    @Override
    public Integer getTotalItems() {
        String sql = "SELECT COUNT(*) FROM dbo.comment";
        return count(sql);
    }

    @Override
    public List<CommentModel> findCommentsByNewsId(Long newsId) {
        StringBuilder sql = new StringBuilder("SELECT comment.id, comment.content,comment.user_id,comment.news_id,\n"
                + "	comment.createddate,comment.createdby,\n"
                + "	dbo.[user].fullname,dbo.[user].avatar,\n"
                + "	dbo.news.title		\n"
                + "FROM dbo.comment\n"
                + "INNER JOIN dbo.[user] ON [user].id = comment.user_id\n"
                + "INNER JOIN dbo.news ON news.id = comment.news_id\n"
                + "WHERE news_id = ? \n"
                + "ORDER BY comment.id DESC");
        return query(sql.toString(), new CommentMapper(), newsId);
    }

    @Override
    public Integer getTotalItemsByNewsId(Long newsId) {
        String sql = "SELECT COUNT(*) FROM dbo.comment\n"
                + "WHERE news_id = ?";
        return count(sql, newsId);
    }

    @Override
    public void update(CommentModel commentUpdate) {
        StringBuilder sql = new StringBuilder("UPDATE dbo.comment\n"
                + "SET content = ?,\n"
                + "	modifieddate = GETDATE(),\n"
                + "	modifiedby = ?\n"
                + "WHERE id = ?");
        update(sql.toString(), commentUpdate.getContent(), commentUpdate.getModifiedBy(), commentUpdate.getId());
    }

}
