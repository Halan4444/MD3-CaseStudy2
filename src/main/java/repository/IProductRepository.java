package repository;

import dto.ContractDTO;
import models.Contract;
import models.Customer;
import models.Product;

import java.util.List;

public interface IProductRepository extends ICRUDRepository<Product>{
    List<ContractDTO> getList();

    Contract findById(Integer id);

    List<ContractDTO> search(String fieldSearch1, String fieldSearch2,
                             String fieldSearch3, String searchKey1, String searchKey2, String searchKey3);
}
