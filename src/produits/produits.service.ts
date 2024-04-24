import { Injectable } from '@nestjs/common';
import { DatabaseService } from '../database/database.service';
import { Prisma } from '@prisma/client';

@Injectable()
export class ProduitsService {
  constructor(private readonly databaseService: DatabaseService) {}
  async create(createProduitDto: Prisma.ProduitCreateInput) {
    return this.databaseService.produit.create({ data: createProduitDto });
  }

  async findAll() {
    return this.databaseService.produit.findMany({});
  }

  async findOne(Id: number) {
    return this.databaseService.produit.findUnique({
      where: {
        Id,
      },
    });
  }

  async update(Id: number, updateProduitDto: Prisma.ProduitUpdateInput) {
    return this.databaseService.produit.update({
      where: {
        Id,
      },
      data: updateProduitDto,
    });
  }

  async remove(Id: number) {
    return this.databaseService.produit.delete({
      where: {
        Id,
      },
    });
  }
}
