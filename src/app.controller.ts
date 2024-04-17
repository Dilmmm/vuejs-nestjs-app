import { Controller, Get } from '@nestjs/common';
import { AppService } from './app.service';

@Controller()
export class AppController {
  constructor(private readonly appService: AppService) {}

  @Get('utilisateurs')
  async getAllUtilisateurs() {
    return await this.appService.getAllUtilisateurs();
  }
  @Get('produits')
  async getAllProducts() {
    return await this.appService.getAllProducts();
  }
}
