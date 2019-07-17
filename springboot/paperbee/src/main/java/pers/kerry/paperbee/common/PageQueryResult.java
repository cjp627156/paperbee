package pers.kerry.paperbee.common;

import com.github.pagehelper.Page;
import java.io.Serializable;
import java.util.List;

/**
 * 基于分页的方法改造
 * PageHelper -> PageInfo -> PageSerializable
 * @param <T>
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
