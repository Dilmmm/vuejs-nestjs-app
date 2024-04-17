import { Injectable } from '@nestjs/common';
import { PrismaService } from './prisma.service';

@Injectable()
export class AppService {
  constructor(private prisma: PrismaService) {}

  async getAllUtilisateurs() {
    return await this.prisma.utilisateur.findMany();
  }
  async getAllProducts() {
    return await this.prisma.produit.findMany();
  }
}
