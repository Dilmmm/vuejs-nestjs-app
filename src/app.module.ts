import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { DatabaseModule } from './database/database.module';
import { ProduitsModule } from './produits/produits.module';

@Module({
  imports: [DatabaseModule, ProduitsModule],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {}
