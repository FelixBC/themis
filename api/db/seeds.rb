
# — Roles —
admin_role = Role.find_or_create_by!(name: 'admin') do |r|
  r.description = 'Administrador del sistema'
end

user_role = Role.find_or_create_by!(name: 'user') do |r|
  r.description = 'Usuario estándar'
end

# — Zona / Grupo / Liga —
central_zone = Zone.find_or_create_by!(name: 'Zona Central') do |z|
  z.description = 'Zona principal de prueba'
end

grupo_a = Group.find_or_create_by!(name: 'Grupo A', zone: central_zone) do |g|
  g.description = 'Grupo de ejemplo'
end

liga_prueba = League.find_or_create_by!(name: 'Liga de Prueba', group: grupo_a) do |l|
  l.sport = 'Baseball'
end

# — Equipos —
home_team = Team.find_or_create_by!(name: 'Home Hawks', league: liga_prueba) do |t|
  t.city = 'Ciudad 1'
end

away_team = Team.find_or_create_by!(name: 'Away Eagles', league: liga_prueba) do |t|
  t.city = 'Ciudad 2'
end

# — Jugadores (pitchers de prueba) —
pitcher_juan = Player.find_or_create_by!(
  first_name: 'Juan',
  last_name:  'Pérez',
  jersey_number: 12,
  position:  'P',
  team:      home_team
)

pitcher_carlos = Player.find_or_create_by!(
  first_name: 'Carlos',
  last_name:  'Ramírez',
  jersey_number: 27,
  position:  'P',
  team:      away_team
)

# — Un partido de ejemplo —
game = Game.find_or_create_by!(
  league:      liga_prueba,
  game_date:   Date.today,
  game_time:   Time.current,
  home_team:   home_team,
  away_team:   away_team,
  location:    'Estadio Central'
)

# — Estadística de pitcheo —
PitchingStat.find_or_create_by!(
  game:           game,
  team:           home_team,
  pitcher:        pitcher_juan,
  is_starter:     true,
  decision:       'W',
  gp_record:      '1-0',
  era:            2.50,
  ip:             7.0,
  hits_allowed:   5,
  runs_allowed:   2,
  walks:          1,
  strikeouts:     8,
  last_gp_record: '0-0',
  last_era:       3.00,
  route:          'home',
  opponent:       away_team.name
)

# — Estadística de básquet —
BasketballStat.find_or_create_by!(
  game:             game,
  team:             home_team,
  points_scored:    102,
  points_allowed:    98,
  win_loss_record:  '1-0'
)

# — Usuarios de prueba —
User.find_or_create_by!(email: 'admin@example.com') do |u|
  u.name       = 'Admin Demo'
  u.role       = admin_role
  u.zone       = central_zone
  u.group      = grupo_a
end

User.find_or_create_by!(email: 'user@example.com') do |u|
  u.name       = 'Usuario Demo'
  u.role       = user_role
  u.zone       = central_zone
  u.group      = grupo_a
end
