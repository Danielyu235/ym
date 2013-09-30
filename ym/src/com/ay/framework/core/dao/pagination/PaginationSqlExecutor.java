package com.ay.framework.core.dao.pagination;

import java.sql.Connection;
import java.sql.SQLException;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.ay.framework.core.dao.dialect.IDialect;
import com.ibatis.sqlmap.engine.execution.SqlExecutor;
import com.ibatis.sqlmap.engine.mapping.statement.RowHandlerCallback;
import com.ibatis.sqlmap.engine.scope.StatementScope;

/**
 *分页改造sql实现类 
 * @author lushigai
 * @version 1.0
 * @Date:2012-9-10
 */
public class PaginationSqlExecutor extends SqlExecutor
{
    /** 日志 */
    private static final Log LOGGER = LogFactory.getLog(PaginationSqlExecutor.class);
    /** 方言 */
    private IDialect dialect;
    /** 是否支持物理分页 */
    private boolean enableLimit = true;

    public IDialect getDialect()
    {
        return dialect;
    }

    public void setDialect(IDialect dialect)
    {
        this.dialect = dialect;
    }

    public boolean isEnableLimit()
    {
        return enableLimit;
    }

    public void setEnableLimit(boolean enableLimit)
    {
        this.enableLimit = enableLimit;
    }

    @Override
    public void executeQuery(StatementScope request, Connection conn, String sql, Object[] parameters, int skipResults,
            int maxResults, RowHandlerCallback callback) throws SQLException
    {
        if ((skipResults != NO_SKIPPED_RESULTS || maxResults != NO_MAXIMUM_RESULTS) && supportsLimit())
        {
            sql = dialect.getLimitString(sql, skipResults, maxResults);
            if (LOGGER.isDebugEnabled())
            {
                LOGGER.debug(sql);
            }
            skipResults = NO_SKIPPED_RESULTS;
            maxResults = NO_MAXIMUM_RESULTS;
        }
        super.executeQuery(request, conn, sql, parameters, skipResults, maxResults, callback);
    }

    /**
     * 返回是否支持物理分页
     * 
     * @return 是否支持物理分页
     */
    private boolean supportsLimit()
    {
        if (enableLimit && dialect != null)
        {
            return dialect.supportsLimit();
        }
        return false;
    }

}
