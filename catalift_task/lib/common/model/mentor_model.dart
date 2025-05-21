class Mentor {
  final String name;
  final double rating;
  final String sector;
  final String experience;
  final String domain;
  final int reviews;
  final String description;
  final double compatibility;
  final String imageUrl;

  Mentor({
    required this.name,
    required this.rating,
    required this.sector,
    required this.experience,
    required this.domain,
    required this.reviews,
    required this.description,
    required this.compatibility,
    required this.imageUrl,
  });
}

List<Mentor> dummyMentors = [
  Mentor(
    name: 'Gaurav Samant',
    rating: 4.9,
    sector: 'IT Sector',
    experience: '4 years',
    domain: 'Business Administration',
    reviews: 175,
    description:
        'Strategy Manager @CEO Office | Ex-eBay & L&T | MDI Gurgaon • ESCP Europe | 32+ National Case Comps Podiums',
    compatibility: 98,
    imageUrl: 'https://randomuser.me/api/portraits/men/11.jpg',
  ),
  Mentor(
    name: 'Gaurav Samant',
    rating: 4.9,
    sector: 'IT Sector',
    experience: '4 years',
    domain: 'Business Administration',
    reviews: 175,
    description:
        'Strategy Manager @CEO Office | Ex-eBay & L&T | MDI Gurgaon • ESCP Europe | 32+ National Case Comps Podiums',
    compatibility: 82,
    imageUrl: 'https://randomuser.me/api/portraits/men/11.jpg',
  ),
  Mentor(
    name: 'Gaurav Samant',
    rating: 4.9,
    sector: 'IT Sector',
    experience: '4 years',
    domain: 'Business Administration',
    reviews: 175,
    description:
        'Strategy Manager @CEO Office | Ex-eBay & L&T | MDI Gurgaon • ESCP Europe | 32+ National Case Comps Podiums',
    compatibility: 75,
    imageUrl: 'https://randomuser.me/api/portraits/men/11.jpg',
  ),
  Mentor(
    name: 'Ananya Singh',
    rating: 4.8,
    sector: 'Finance',
    experience: '6 years',
    domain: 'Investment Banking',
    reviews: 142,
    description:
        'Senior Analyst | JP Morgan | IIM Bangalore | 5+ years in capital markets',
    compatibility: 94,
    imageUrl: 'https://randomuser.me/api/portraits/women/12.jpg',
  ),
  Mentor(
    name: 'Rahul Sharma',
    rating: 4.7,
    sector: 'Marketing',
    experience: '8 years',
    domain: 'Digital Marketing',
    reviews: 203,
    description:
        'Marketing Director | ex-Google | IMT Ghaziabad | Digital Marketing Expert',
    compatibility: 89,
    imageUrl: 'https://randomuser.me/api/portraits/men/32.jpg',
  ),
];
