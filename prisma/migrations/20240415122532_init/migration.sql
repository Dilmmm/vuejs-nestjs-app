-- CreateTable
CREATE TABLE "Utilisateur" (
    "Id" SERIAL NOT NULL,
    "pseudo" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "mot_de_passe" TEXT NOT NULL,
    "prenom" TEXT NOT NULL,
    "nom" TEXT NOT NULL,
    "date_inscription" TIMESTAMP(3) NOT NULL,
    "actif" BOOLEAN NOT NULL DEFAULT false,

    CONSTRAINT "Utilisateur_pkey" PRIMARY KEY ("Id")
);

-- CreateTable
CREATE TABLE "Categorie" (
    "Id" SERIAL NOT NULL,
    "nom" TEXT NOT NULL,

    CONSTRAINT "Categorie_pkey" PRIMARY KEY ("Id")
);

-- CreateTable
CREATE TABLE "Produit" (
    "Id" SERIAL NOT NULL,
    "nom" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "image" TEXT NOT NULL,
    "categorie_id" INTEGER NOT NULL,

    CONSTRAINT "Produit_pkey" PRIMARY KEY ("Id")
);

-- CreateTable
CREATE TABLE "Recette" (
    "Id" SERIAL NOT NULL,
    "nom" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "image" TEXT NOT NULL,

    CONSTRAINT "Recette_pkey" PRIMARY KEY ("Id")
);

-- CreateTable
CREATE TABLE "RecetteProduit" (
    "recette_id" INTEGER NOT NULL,
    "produit_id" INTEGER NOT NULL,

    CONSTRAINT "RecetteProduit_pkey" PRIMARY KEY ("recette_id","produit_id")
);

-- CreateTable
CREATE TABLE "Commentaire" (
    "Id" SERIAL NOT NULL,
    "auteur" TEXT NOT NULL,
    "titre" TEXT NOT NULL,
    "texte" TEXT NOT NULL,
    "recette_id" INTEGER NOT NULL,
    "note" INTEGER NOT NULL,

    CONSTRAINT "Commentaire_pkey" PRIMARY KEY ("Id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Utilisateur_email_key" ON "Utilisateur"("email");

-- AddForeignKey
ALTER TABLE "Produit" ADD CONSTRAINT "Produit_categorie_id_fkey" FOREIGN KEY ("categorie_id") REFERENCES "Categorie"("Id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "RecetteProduit" ADD CONSTRAINT "RecetteProduit_produit_id_fkey" FOREIGN KEY ("produit_id") REFERENCES "Produit"("Id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "RecetteProduit" ADD CONSTRAINT "RecetteProduit_recette_id_fkey" FOREIGN KEY ("recette_id") REFERENCES "Recette"("Id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Commentaire" ADD CONSTRAINT "Commentaire_recette_id_fkey" FOREIGN KEY ("recette_id") REFERENCES "Recette"("Id") ON DELETE RESTRICT ON UPDATE CASCADE;
