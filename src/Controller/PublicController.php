<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Bundle\FrameworkBundle\Tests\Fixtures\Validation\Article;
use Symfony\Component\Routing\Annotation\Route;
use App\Entity\Sections;
use App\Entity\Articles;

class PublicController extends AbstractController
{
    /**
     * @Route("/", name="accueil")
     */
    public function index()
    {
        $entityManager = $this->getDoctrine()->getManager();
        $rub = $entityManager->getRepository(Sections::class)->findAll();
        $art = $entityManager->getRepository(Articles::class)->findBy([],["idarticles"=>"DESC"]);
        return $this->render('public/index.html.twig', [
            'sections' => $rub,
            'articles' => $art,
        ]);
    }
    /**
     *
     * Matches /article/{id},
     * {id} is a requirement digit: "\d+" for more security ,
     * to view an article's detail
     *
     * @Route("/a/{id}", name="detail_article", requirements={"id"="\d+"})
     */
    public function oneArticle($id){
        $entityManager = $this->getDoctrine()->getManager();
        $rub = $entityManager->getRepository(Sections::class)->findAll();
        $art = $entityManager->getRepository(Articles::class)->find($id);
        return $this->render('public/one_article.html.twig', [
            'sections' => $rub,
            'articles' => $art,
        ]);
    }
    /**
     *
     * Matches /section/{id},
     * {id} is a requirement digit: "\d+" for more security ,
     * to view an article's detail
     *
     * @Route("/section/{id}", name="detail_section", requirements={"id"="\d+"})
     */
    public function oneSection($id){
        $entityManager = $this->getDoctrine()->getManager();
        $rub = $entityManager->getRepository(Sections::class)->findAll();
        $section = $entityManager->getRepository(Sections::class)->find($id);

        $art = $section->getArticlesarticles();

 /*       $rawSql = "SELECT m.id, (SELECT COUNT(i.id) FROM item AS i WHERE i.myclass_id = m.id) AS total FROM myclass AS m";

        $stmt = $this->getEntityManager()->getConnection()->prepare($rawSql);
        $stmt->execute([]);

        return $stmt->fetchAll();*/

        return $this->render('public/one_section.html.twig', [
            'sections' => $rub,
            'section' => $section,
            'articles' => $art,
        ]);
    }
}
