package com.definesys.bees.dao;

import com.definesys.bees.pojo.SystemConfig;
import com.definesys.mpaas.query.MpaasQueryFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class SystemConfigDao {

    @Autowired
    private MpaasQueryFactory sw;

//    public String getValueByKey(String key) {
//        return sw.buildQuery()
//                .sql("select sys_value from system_config where sys_key=#key")
//                .setVar("key", key)
//                .doQueryFirst(SystemConfig.class).getSysValue();
//    }
}
