package com.renhouse.service.impl;

import com.renhouse.dao.HouseDao;
import com.renhouse.dao.impl.HouseDaoImpl;
import com.renhouse.pojo.House;
import com.renhouse.pojo.Page;
import com.renhouse.pojo.vo.Bill;
import com.renhouse.pojo.vo.HouseStatus;
import com.renhouse.pojo.vo.TenantMaintenanceFee;
import com.renhouse.service.HouseService;

import java.util.List;

public class HouseServiceImpl implements HouseService {
    private HouseDao houseDao = new HouseDaoImpl();
    @Override
    public void addHouse(House house) {
        houseDao.addHouse(house);
    }

    @Override
    public void deleteHouseById(Integer id) {
        houseDao.deleteHouseById(id);
    }

    @Override
    public void updateHouse(House house) {
        houseDao.updateHouse(house);
    }

    @Override
    public House queryHouseById(Integer id) {
        HouseDao houseDao = new HouseDaoImpl();
        return houseDao.queryHouseById(id);
    }

    @Override
    public List<House> queryHouses() {
        return houseDao.queryHouses();
    }

    @Override
    public Page<House> page(String username, int pageNo, int pageSize) {
        Page<House> page = new Page<House>();
        HouseDao houseDao = new HouseDaoImpl();

        // 设置每页显示的数量
        page.setPageSize(pageSize);
        // 求总记录数
        Integer pageTotalCount = houseDao.queryForPageTotalCount();
        // 设置总记录数
        page.setPageTotalCount(pageTotalCount);
        // 求总页码
        Integer pageTotal = pageTotalCount / pageSize;
        if (pageTotalCount % pageSize > 0) {
            pageTotal+=1;
        }
        // 设置总页码
        page.setPageTotal(pageTotal);

        // 设置当前页码
        page.setPageNo(pageNo);

        // 求当前页数据的开始索引
        int begin = (page.getPageNo() - 1) * pageSize;
        // 求当前页数据
        List<House> items = houseDao.queryForPageItemsByLandlord(begin, pageSize, username);
        // 设置当前页数据
        page.setItems(items);

        return page;
    }

    @Override
    public List<HouseStatus> queryHouseByLandlordAndStatus_Already(String landlord) {
        return  houseDao.queryHouseByLandlordAndStatus_Already(landlord);
    }

    @Override
    public Page<HouseStatus> pageForRentedHouse(String username, int pageNo, int pageSize) {
        Page<HouseStatus> page = new Page<HouseStatus>();

        // 设置每页显示的数量
        page.setPageSize(pageSize);
        // 求总记录数
        Integer pageTotalCount = houseDao.queryHouseByLandlordAndStatusAlreadyCount(username);
        // 设置总记录数
        page.setPageTotalCount(pageTotalCount);
        // 求总页码
        Integer pageTotal = pageTotalCount / pageSize;
        if (pageTotalCount % pageSize > 0) {
            pageTotal+=1;
        }
        // 设置总页码
        page.setPageTotal(pageTotal);

        // 设置当前页码
        page.setPageNo(pageNo);

        // 求当前页数据的开始索引
        int begin = (page.getPageNo() - 1) * pageSize;
        // 求当前页数据
        List<HouseStatus> items = houseDao.queryForPageItemsByRentedStatus(begin, pageSize,username);
        // 设置当前页数据
        page.setItems(items);

        return page;
    }

    @Override
    public Page<House> pageForUnRentedHouse(String username, int pageNo, int pageSize) {
        Page<House> page = new Page<House>();

        // 设置每页显示的数量
        page.setPageSize(pageSize);
        // 求总记录数
        Integer pageTotalCount = houseDao.queryForUnRentedHouseCount(username);
        // 设置总记录数
        page.setPageTotalCount(pageTotalCount);
        // 求总页码
        Integer pageTotal = pageTotalCount / pageSize;
        if (pageTotalCount % pageSize > 0) {
            pageTotal+=1;
        }
        // 设置总页码
        page.setPageTotal(pageTotal);

        // 设置当前页码
        page.setPageNo(pageNo);

        // 求当前页数据的开始索引
        int begin = (page.getPageNo() - 1) * pageSize;
        // 求当前页数据
        List<House> items = houseDao.queryForUnRentedHouseItems(begin, pageSize,username);
        // 设置当前页数据
        page.setItems(items);

        return page;
    }

    @Override
    public Page<TenantMaintenanceFee> pageForMaintenanceFee(String username, String tenant,int pageNo, int pageSize) {
        Page<TenantMaintenanceFee> page = new Page<TenantMaintenanceFee>();

        // 设置每页显示的数量
        page.setPageSize(pageSize);
        // 求总记录数
        Integer pageTotalCount = houseDao.queryMaintenanceFeeByLandlordCount(username,tenant);
        // 设置总记录数
        page.setPageTotalCount(pageTotalCount);
        // 求总页码
        Integer pageTotal = pageTotalCount / pageSize;
        if (pageTotalCount % pageSize > 0) {
            pageTotal+=1;
        }
        // 设置总页码
        page.setPageTotal(pageTotal);

        // 设置当前页码
        page.setPageNo(pageNo);

        // 求当前页数据的开始索引
        int begin = (page.getPageNo() - 1) * pageSize;
        // 求当前页数据
        List<TenantMaintenanceFee> items = houseDao.queryPagesForMaintenanceFeeByLandlordAndTenant(begin, pageSize,username,tenant);
        // 设置当前页数据
        page.setItems(items);

        return page;
    }

    @Override
    public Page<TenantMaintenanceFee> pageForMaintenanceFee(String username, int pageNo, int pageSize) {
        Page<TenantMaintenanceFee> page = new Page<TenantMaintenanceFee>();

        // 设置每页显示的数量
        page.setPageSize(pageSize);
        // 求总记录数
        Integer pageTotalCount = houseDao.queryMaintenanceFeeByLandlordCount(username);
        // 设置总记录数
        page.setPageTotalCount(pageTotalCount);
        // 求总页码
        Integer pageTotal = pageTotalCount / pageSize;
        if (pageTotalCount % pageSize > 0) {
            pageTotal+=1;
        }
        // 设置总页码
        page.setPageTotal(pageTotal);

        // 设置当前页码
        page.setPageNo(pageNo);

        // 求当前页数据的开始索引
        int begin = (page.getPageNo() - 1) * pageSize;
        // 求当前页数据
        List<TenantMaintenanceFee> items = houseDao.queryPagesForMaintenanceFeeByLandlordAndTenant(begin, pageSize,username);
        // 设置当前页数据
        page.setItems(items);

        return page;
    }

    @Override
    public Page<HouseStatus> pageForNearDate(String username, int pageNo, int pageSize) {
        Page<HouseStatus> page = new Page<HouseStatus>();

        // 设置每页显示的数量
        page.setPageSize(pageSize);
        // 求总记录数
        Integer pageTotalCount = houseDao.queryForNearDateCount(username);
        // 设置总记录数
        page.setPageTotalCount(pageTotalCount);
        // 求总页码
        Integer pageTotal = pageTotalCount / pageSize;
        if (pageTotalCount % pageSize > 0) {
            pageTotal+=1;
        }
        // 设置总页码
        page.setPageTotal(pageTotal);

        // 设置当前页码
        page.setPageNo(pageNo);

        // 求当前页数据的开始索引
        int begin = (page.getPageNo() - 1) * pageSize;
        // 求当前页数据
        List<HouseStatus> items = houseDao.queryForNearDateItems(begin, pageSize,username);
        // 设置当前页数据
        page.setItems(items);

        return page;
    }
}
