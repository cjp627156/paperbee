package pers.kerry.paperbee.common;

import com.github.pagehelper.Page;
import java.io.Serializable;
import java.util.List;

/**
 *  @Copyright: Shanghai Definesys Company.All rights reserved.
 *  @Description: 分页方法的改造，PageHelper -> PageInfo -> PageSerializable
 *  @author: kerry.wu
 *  @since: 2019/8/8  18:08
 *  @history:
 *          1.2019/8/8 created by kerry.wu
 */
public class PageQueryResult<T> implements Serializable {
    private static final long serialVersionUID = 1L;
    protected long count;
    protected List<T> result;

    public PageQueryResult() {
    }

    public PageQueryResult(List<T> list) {
        this.result = list;
        if (list instanceof Page) {
            this.count = ((Page)list).getTotal();
        } else {
            this.count = (long)list.size();
        }

    }

    public static <T> PageQueryResult<T> of(List<T> list) {
        return new PageQueryResult(list);
    }

    public long getCount() {
        return this.count;
    }

    public void setCount(long total) {
        this.count = total;
    }

    public List<T> getResult() {
        return this.result;
    }

    public void setResult(List<T> list) {
        this.result = list;
    }

    public String toString() {
        return "PageQueryResult{count=" + this.count + ", result=" + this.result + '}';
    }
}
